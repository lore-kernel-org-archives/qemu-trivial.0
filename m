Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yg6VK-0008HW-IF
	for mharc-qemu-trivial@gnu.org; Thu, 09 Apr 2015 03:03:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Yg6VH-0008CZ-Bt
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 03:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Yg6VG-00035h-Kj
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 03:03:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Yg6V7-00033Q-Mv; Thu, 09 Apr 2015 03:03:45 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3973fUx007988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 9 Apr 2015 03:03:42 -0400
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3973dSx023307; Thu, 9 Apr 2015 03:03:40 -0400
Message-ID: <1428563018.3974.4.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chih-Min Chao <cmchao@gmail.com>
Date: Thu, 09 Apr 2015 09:03:38 +0200
In-Reply-To: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
References: <1428516254-23054-1-git-send-email-cmchao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/5] fix coding style and use of typedef
	type
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
X-List-Received-Date: Thu, 09 Apr 2015 07:03:56 -0000

On Do, 2015-04-09 at 02:04 +0800, Chih-Min Chao wrote:
>   bitops : fix coding style
>   ui/vnc : fix coding style
>   ui/vnc : remove 'struct' of 'typedef struct'
>   ui/console : remove 'struct' from 'typedef struct' type
>   hw/display : remove 'struct' from 'typedef QXL struct'

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


