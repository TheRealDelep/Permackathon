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
    public class ToDoesController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<ToDo> toDoRepository;

        public ToDoesController(PermaContext context)
        {
            _context = context;
            toDoRepository = new GenericRepository<ToDo>(context);
        }

        // GET: api/ToDoes
        [HttpGet]
        public ActionResult<IEnumerable<ToDo>> GetToDos()
        {
            return toDoRepository.Get().ToList();
            //await _context.ToDos.ToListAsync();
        }

        // GET: api/ToDoes/5
        [HttpGet("{id}")]
        public ActionResult<ToDo> GetToDo(int id)
        {
            var toDo = toDoRepository.GetByID(id);
                //await _context.ToDos.FindAsync(id);

            if (toDo == null)
            {
                return NotFound();
            }

            return toDo;
        }
        //-----------list of task of a SELECTEDyear
        //
        ////2. get
        //[Route("ToDoes/GetByDate")]
        //[HttpGet] // [HttpGet("{selectedDate}")]
        //public ActionResult<IEnumerable<ToDo>> GetToDoByDate(string selectedDate )
        //{
        //    DateTime dateY = Convert.ToDateTime(selectedDate + "-12-31");
        //    return toDoRepository.Get(item => item.DateStart < dateY && item.DateStart> dateY.AddYears(-1)).ToList();
            
        //}

        // PUT: api/ToDoes/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public  IActionResult PutToDo(int id, ToDo toDo)
        {
            if (id != toDo.Id)
            {
                return BadRequest();
            }

            _context.Entry(toDo).State = EntityState.Modified;

            try
            {
                toDoRepository.Update(toDo);
                //await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ToDoExists(id))
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

        // POST: api/ToDoes
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<ToDo> PostToDo(ToDo toDo)
        {
           
            toDoRepository.Insert(toDo);

            //await _context.SaveChangesAsync();

            return CreatedAtAction("GetToDo", new { id = toDo.Id }, toDo);
        }

        // DELETE: api/ToDoes/5
        [HttpDelete("{id}")]
        public ActionResult<ToDo> DeleteToDo(int id)
        {
            var toDo = toDoRepository.GetByID(id);
            //await _context.ToDos.FindAsync(id);
            if (toDo == null)
            {
                return NotFound();
            }

            toDoRepository.Delete(toDo);
            //await _context.SaveChangesAsync();

            return toDo;
        }

        private bool ToDoExists(int id)
        {
            return _context.ToDos.Any(e => e.Id == id);
        }
    }
}
