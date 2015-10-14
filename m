Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZmMGV-0007qd-C7
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2015 09:38:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1ZmFwg-0004uF-ML
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 02:53:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1ZmFwf-0006jR-MO
	for qemu-trivial@nongnu.org; Wed, 14 Oct 2015 02:53:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1ZmFwZ-0006iZ-Hy; Wed, 14 Oct 2015 02:53:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id F23A64AD5F;
	Wed, 14 Oct 2015 06:53:46 +0000 (UTC)
Received: from javelin (vpn1-6-188.sin2.redhat.com [10.67.6.188])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9E6rfUi010923
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 14 Oct 2015 02:53:44 -0400
Date: Wed, 14 Oct 2015 12:23:40 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Kevin Wolf <kwolf@redhat.com>
In-Reply-To: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
Message-ID: <alpine.LFD.2.20.1510141207460.9023@wniryva>
References: <1444721930-5121-1-git-send-email-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 14 Oct 2015 09:38:46 -0400
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
X-List-Received-Date: Wed, 14 Oct 2015 06:53:55 -0000

+-- On Tue, 13 Oct 2015, Kevin Wolf wrote --+
| diff --git a/gdbstub.c b/gdbstub.c
| index d2c95b5..9c29aa0 100644
| --- a/gdbstub.c
| +++ b/gdbstub.c
| @@ -956,6 +956,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
|          if (*p == ',')
|              p++;
|          len = strtoull(p, NULL, 16);
| +
| +        /* memtohex() doubles the required space */
| +        if (len > MAX_PACKET_LENGTH / 2) {
| +            put_packet (s, "E22");
| +            break;
| +        }
| +
|          if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) != 0) {
|              put_packet (s, "E14");
|          } else {
| @@ -970,6 +977,12 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
|          len = strtoull(p, (char **)&p, 16);
|          if (*p == ':')
|              p++;
| +
| +        /* hextomem() reads 2*len bytes */
| +        if (len > strlen(p) / 2) {
| +            put_packet (s, "E22");
| +            break;
| +        }
|          hextomem(mem_buf, p, len);
|          if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
|                                     true) != 0) {
| @@ -1107,7 +1120,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
|              cpu = find_cpu(thread);
|              if (cpu != NULL) {
|                  cpu_synchronize_state(cpu);
| -                len = snprintf((char *)mem_buf, sizeof(mem_buf),
| +                /* memtohex() doubles the required space */
| +                len = snprintf((char *)mem_buf, sizeof(buf) / 2,
|                                 "CPU#%d [%s]", cpu->cpu_index,
|                                 cpu->halted ? "halted " : "running");
|                  memtohex(buf, mem_buf, len);
| @@ -1136,8 +1150,8 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
|                  put_packet(s, "E01");
|                  break;
|              }
| -            hextomem(mem_buf, p + 5, len);
|              len = len / 2;
| +            hextomem(mem_buf, p + 5, len);
|              mem_buf[len++] = 0;
|              qemu_chr_be_write(s->mon_chr, mem_buf, len);
|              put_packet(s, "OK");
| 

Yes, patch looks good to fix the said buffer overflows.

Nevertheless, I wonder how hextomem() & memtohex() routines help? Because IIUC 
they seem to be changing command semantics. Ie host gdb(1) user would need to 
supply len/2 value to read/write 'len' bytes.

--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

