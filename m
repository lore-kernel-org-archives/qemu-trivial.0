Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WUs9a-0004RG-FV
	for mharc-qemu-trivial@gnu.org; Tue, 01 Apr 2014 02:26:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WUs9S-0003ma-0I
	for qemu-trivial@nongnu.org; Tue, 01 Apr 2014 02:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WUs9L-0001MC-SV
	for qemu-trivial@nongnu.org; Tue, 01 Apr 2014 02:26:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WUs98-0001G1-By; Tue, 01 Apr 2014 02:26:06 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s316Q3mK009453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 1 Apr 2014 02:26:04 -0400
Received: from [10.36.4.48] (vpn1-4-48.ams2.redhat.com [10.36.4.48])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s316Q1I4020919; Tue, 1 Apr 2014 02:26:01 -0400
Message-ID: <1396333560.17363.4.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hani Benhabiles <kroosec@gmail.com>
Date: Tue, 01 Apr 2014 08:26:00 +0200
In-Reply-To: <1396303746-1858-1-git-send-email-kroosec@gmail.com>
References: <1396303746-1858-1-git-send-email-kroosec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, aliguori@amazon.com,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] input: mouse_set should check input
	device type.
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
X-List-Received-Date: Tue, 01 Apr 2014 06:26:32 -0000

On Mo, 2014-03-31 at 23:09 +0100, Hani Benhabiles wrote:
> Otherwise, the index of an input device like a usb-kbd is silently
> accepted.
> 
> (qemu) info mice
>   Mouse #2: QEMU PS/2 Mouse
> * Mouse #3: QEMU HID Mouse
> (qemu) mouse_set 1
> (qemu) info mice
>   Mouse #2: QEMU PS/2 Mouse
> * Mouse #3: QEMU HID Mouse
> 
> Also replace monitor_printf() call in do_mouse_set() with
> error_report() and
> adjust error message.

Added to input patch queue.

thanks,
  Gerd



