Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJ0WW-0007kj-Lo
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 09:01:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palves@redhat.com>) id 1YJ080-0007UZ-Sr
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 08:36:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palves@redhat.com>) id 1YJ07z-00071D-IE
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 08:36:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palves@redhat.com>)
	id 1YJ07t-0006yr-GT; Wed, 04 Feb 2015 08:36:17 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14DaERI032146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 08:36:14 -0500
Received: from [127.0.0.1] (ovpn01.gateway.prod.ext.ams2.redhat.com
	[10.39.146.11])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14DaCbP015780; Wed, 4 Feb 2015 08:36:12 -0500
Message-ID: <54D2204B.3010903@redhat.com>
Date: Wed, 04 Feb 2015 14:36:11 +0100
From: Pedro Alves <palves@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@web.de>, qemu-trivial <qemu-trivial@nongnu.org>
References: <54CCA038.8000704@web.de>
In-Reply-To: <54CCA038.8000704@web.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 04 Feb 2015 09:01:43 -0500
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Add GDB qAttached
	support
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
X-List-Received-Date: Wed, 04 Feb 2015 13:36:25 -0000

Hi, I was skimming the list, and noticed:

On 01/31/2015 10:28 AM, Jan Kiszka wrote:
> @@ -1187,6 +1193,10 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>              put_packet_binary(s, buf, len + 1);
>              break;
>          }
> +        if (strncmp(p, "Attached", 8) == 0) {

This looks like it'd mishandle a future qAttached2 packet.

It should be doing something like:

       if (strncmp(p, "Attached", 8) == 0 &&
          (p[8] == '\0' || p[8] == ':')) {

or:

       if (strcmp(p, "Attached") == 0 || strncmp(p, "Attached:", 9) == 0) {


Likewise other packets, if they have the same issue.
(I'm not familiar with qemu's stub's internals.)

Thanks,
Pedro Alves


