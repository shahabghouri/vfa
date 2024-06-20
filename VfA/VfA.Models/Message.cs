using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
	public class Message
	{
		[Key]
		public int MessageId { get; set; }

		[Required]
		public string SenderUserId { get; set; }

		[Required]
		public string ReceiverUserId { get; set; }

		[Required]
		[MaxLength(500)] 
		public string Content { get; set; }

		[Required]
		public DateTime Timestamp { get; set; }

		public bool IsRead { get; set; }

		public string AttachmentUrl { get; set; }


		[ForeignKey("SenderUserId")]
		public virtual ApplicationUser Sender { get; set; }

		[ForeignKey("ReceiverUserId")]
		public virtual ApplicationUser Receiver { get; set; }
	}
}
