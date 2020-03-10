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
    public class StatesController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<State> stateRepository;

        public StatesController(PermaContext context)
        {
            _context = context;
            stateRepository = new GenericRepository<State>(context);
        }

        // GET: api/States
        [HttpGet]
        public ActionResult<IEnumerable<State>> GetStates()
        {
            return stateRepository.Get().ToList();
            //await _context.States.ToListAsync();
        }

        // GET: api/States/5
        [HttpGet("{id}")]
        public ActionResult<State> GetState(int id)
        {
            var state = stateRepository.GetByID(id);
            //await _context.States.FindAsync(id);

            if (state == null)
            {
                return NotFound();
            }

            return state;
        }

        // PUT: api/States/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public ActionResult PutState(int id, State state)
        {
            if (id != state.Id)
            {
                return BadRequest();
            }

            _context.Entry(state).State = EntityState.Modified;

            try
            {
                stateRepository.Update(state);
                //await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StateExists(id))
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

        // POST: api/States
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<State> PostState(State state)
        {
            _context.States.Add(state);

            stateRepository.Insert(state);
            //await _context.SaveChangesAsync();

            return CreatedAtAction("GetState", new { id = state.Id }, state);
        }

        // DELETE: api/States/5
        [HttpDelete("{id}")]
        public ActionResult<State> DeleteState(int id)
        {
            var state = stateRepository.GetByID(id);
                //await _context.States.FindAsync(id);
            if (state == null)
            {
                return NotFound();
            }

            stateRepository.Delete(state);
            //await _context.SaveChangesAsync();

            return state;
        }

        private bool StateExists(int id)
        {
            return _context.States.Any(e => e.Id == id);
        }
    }
}
