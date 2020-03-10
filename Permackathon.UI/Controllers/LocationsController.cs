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
    public class LocationsController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<Location> locationRepository;

        public LocationsController(PermaContext context)
        {
            _context = context;
            locationRepository = new GenericRepository<Location>(context);
        }

        // GET: api/Locations
        [HttpGet]
        public ActionResult<IEnumerable<Location>> GetLocations()
        {
            return locationRepository.Get().ToList();
        }

        // GET: api/Locations/5
        [HttpGet("{id}")]
        public ActionResult<Location> GetLocation(int id)
        {
            var location = locationRepository.GetByID(id);

            if (location == null)
            {
                return NotFound();
            }

            return location;
        }

        // PUT: api/Locations/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public IActionResult PutLocation(int id, Location location)
        {
            if (id != location.Id)
            {
                return BadRequest();
            }

            _context.Entry(location).State = EntityState.Modified;

            try
            {
                 _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LocationExists(id))
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

        // POST: api/Locations
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<Location> PostLocation(Location location)
        {
            locationRepository.Insert(location);
            return CreatedAtAction("GetLocation", new { id = location.Id }, location);
        }

        // DELETE: api/Locations/5
        [HttpDelete("{id}")]
        public ActionResult<Location> DeleteLocation(int id)
        {
            var location = locationRepository.GetByID(id);
            if (location == null)
            {
                return NotFound();
            }

            locationRepository.Delete(location);

            return location;
        }

        private bool LocationExists(int id)
        {
            return _context.Locations.Any(e => e.Id == id);
        }
    }
}