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
    public class MembersController : ControllerBase
    {
        private readonly PermaContext _context;
        private GenericRepository<Member> memberRepository;

        public MembersController(PermaContext context)
        {
            _context = context;
            memberRepository = new GenericRepository<Member>(context);
        }

        // GET: api/Members
        [HttpGet]
        public ActionResult<IEnumerable<Member>> GetMembers()
        {
            return memberRepository.Get().ToList();
        }

        // GET: api/Members/5
        [HttpGet("{id}")]
        public ActionResult<Member> GetMember(int id)
        {
            var member = memberRepository.GetByID(id);

            if (member == null)
            {
                return NotFound();
            }

            return member;
        }

        // PUT: api/Members/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public ActionResult PutMember(int id, Member member)
        {
            if (id != member.Id)
            {
                return BadRequest();
            }

            _context.Entry(member).State = EntityState.Modified;

            try
            {
                memberRepository.Update(member);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberExists(id))
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

        // POST: api/Members
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public ActionResult<Member> PostMember(Member member)
        {
            memberRepository.Insert(member);
            
            return CreatedAtAction("GetMember", new { id = member.Id }, member);
        }

        // DELETE: api/Members/5
        [HttpDelete("{id}")]
        public ActionResult<Member> DeleteMember(int id)
        {
            var member = memberRepository.GetByID(id);
            if (member == null)
            {
                return NotFound();
            }

            memberRepository.Delete(member);
            

            return member;
        }

        private bool MemberExists(int id)
        {
            return _context.Members.Any(e => e.Id == id);
        }
    }
}
