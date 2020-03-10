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
    public class RolesController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<Role> roleRepository;

        public RolesController(PermaContext context)
        {
            _context = context;
            roleRepository = new GenericRepository<Role>(context);
        }

        // GET: api/Roles
        [HttpGet]
        public ActionResult<IEnumerable<Role>> GetRoles()
        {
            return roleRepository.Get().ToList();
            
        }

        // GET: api/Roles/5
        [HttpGet("{id}")]
        public ActionResult<Role> GetRole(int id)
        {
            var role = roleRepository.GetByID(id);
              
            if (role == null)
            {
                return NotFound();
            }

            return role;
        }

        // PUT: api/Roles/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public ActionResult PutRole(int id, Role role)
        {
            if (id != role.Id)
            {
                return BadRequest();
            }
           // ?
            _context.Entry(role).State = EntityState.Modified;

            try
            {
                roleRepository.Update(role);
                
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RoleExists(id))
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

        // POST: api/Roles
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<Role> PostRole(Role role)
        {
            roleRepository.Insert(role);
            //_context.Roles.Add(role);
            //await _context.SaveChangesAsync();

            return CreatedAtAction("GetRole", new { id = role.Id }, role);
        }

        // DELETE: api/Roles/5
        [HttpDelete("{id}")]
        public ActionResult<Role> DeleteRole(int id)
        {
            var role = roleRepository.GetByID(id);
            if (role == null)
            {
                return NotFound();
            }

            roleRepository.Delete(role);
            
            return role;
        }

        private bool RoleExists(int id)
        {
            return _context.Roles.Any(e => e.Id == id);
        }
    }
}
