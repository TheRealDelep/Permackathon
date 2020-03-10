using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Permackathon.DAL;
using Permackathon.DAL.Entities;

namespace Permackathon.UI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrioritiesController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<Priority> priorityRepository;

        public PrioritiesController(PermaContext context)
        {
            _context = context;
            priorityRepository = new GenericRepository<Priority>(context);
        }

        // GET: api/Priorities
        [HttpGet]
        public ActionResult<IEnumerable<Priority>> GetPriorities()
        {
            return priorityRepository.Get().ToList();
                //await _context.Priorities.ToListAsync();
        }

        // GET: api/Priorities/5
        [HttpGet("{id}")]
        public ActionResult<Priority> GetPriority(int id)
        {
            var priority = priorityRepository.GetByID(id);
            
            //await _context.Priorities.FindAsync(id);

            if (priority == null)
            {
                return NotFound();
            }

            return priority;
        }

        // PUT: api/Priorities/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public ActionResult PutPriority(int id, Priority priority)
        {
            if (id != priority.Id)
            {
                return BadRequest();
            }

            _context.Entry(priority).State = EntityState.Modified;

            try
            {
                priorityRepository.Update(priority);
                //await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PriorityExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Priorities
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<Priority> PostPriority(Priority priority)
        {
            _context.Priorities.Add(priority);
            priorityRepository.Insert(priority);
            //await _context.SaveChangesAsync();

            return CreatedAtAction("GetPriority", new { id = priority.Id }, priority);
        }

        // DELETE: api/Priorities/5
        [HttpDelete("{id}")]
        public ActionResult<Priority> DeletePriority(int id)
        {
            var priority = priorityRepository.GetByID(id);
                //await _context.Priorities.FindAsync(id);
            if (priority == null)
            {
                return NotFound();
            }

           priorityRepository.Delete(priority);
            //await _context.SaveChangesAsync();

            return priority;
        }

        private bool PriorityExists(int id)
        {
            return _context.Priorities.Any(e => e.Id == id);
        }
    }
}
