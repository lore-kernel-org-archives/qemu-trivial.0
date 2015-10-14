Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmH8n-0006Xc-6B
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2015 04:10:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZmH7p-0006BB-C2
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 04:09:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1ZmH7j-0003H2-KE
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 04:09:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1ZmH7R-0003Cn-EX; Wed, 14 Oct 2015 04:09:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id C3175A10A6;
	Wed, 14 Oct 2015 08:09:04 +0000 (UTC)
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t9E893th030736; Wed, 14 Oct 2015 04:09:03 -0400
Date: Wed, 14 Oct 2015 10:09:02 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: P J P <ppandit@redhat.com>
Message-ID: <20151014080902.GA4281@noname.str.redhat.com>
References: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
	<alpine.LFD.2.20.1510141207460.9023@wniryva>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1510141207460.9023@wniryva>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Fix buffer
 overflows in gdb_handle_packet()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 08:09:34 -0000

Am 14.10.2015 um 08:53 hat P J P geschrieben:
> +-- On Tue, 13 Oct 2015, Kevin Wolf wrote --+
> | diff --git a/gdbstub.c b/gdbstub.c
> | index d2c95b5..9c29aa0 100644
> | --- a/gdbstub.c
> | +++ b/gdbstub.c
> | @@ -956,6 +956,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
> |          if (*p == ',')
> |              p++;
> |          len = strtoull(p, NULL, 16);
> | +
> | +        /* memtohex() doubles the required space */
> | +        if (len > MAX_PACKET_LENGTH / 2) {
> | +            put_packet (s, "E22");
> | +            break;
> | +        }
> | +
> |          if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) != 0) {
> |              put_packet (s, "E14");
> |          } else {
> | @@ -970,6 +977,12 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
> |          len = strtoull(p, (char **)&p, 16);
> |          if (*p == ':')
> |              p++;
> | +
> | +        /* hextomem() reads 2*len bytes */
> | +        if (len > strlen(p) / 2) {
> | +            put_packet (s, "E22");
> | +            break;
> | +        }
> |          hextomem(mem_buf, p, len);
> |          if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
> |                                     true) != 0) {
> | @@ -1107,7 +1120,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
> |              cpu = find_cpu(thread);
> |              if (cpu != NULL) {
> |                  cpu_synchronize_state(cpu);
> | -                len = snprintf((char *)mem_buf, sizeof(mem_buf),
> | +                /* memtohex() doubles the required space */
> | +                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
> |                                 "CPU#%d [%s]", cpu->cpu_index,
> |                                 cpu->halted ? "halted " : "running");
> |                  memtohex(buf, mem_buf, len);
> | @@ -1136,8 +1150,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
> |                  put_packet(s, "E01");
> |                  break;
> |              }
> | -            hextomem(mem_buf, p + 5, len);
> |              len = len / 2;
> | +            hextomem(mem_buf, p + 5, len);
> |              mem_buf[len++] = 0;
> |              qemu_chr_be_write(s->mon_chr, mem_buf, len);
> |              put_packet(s, "OK");
> | 
> 
> Yes, patch looks good to fix the said buffer overflows.
> 
> Nevertheless, I wonder how hextomem() & memtohex() routines help? Because IIUC 
> they seem to be changing command semantics. Ie host gdb(1) user would need to 
> supply len/2 value to read/write 'len' bytes.

That's just how the gdb protocol works. Binary data is transferred as a
string of hex digits, with every byte being represented by two digits.
The requested length is in bytes of binary data, so the length of the
actually transferred data on the wire is indeed double that length.

Kevin

