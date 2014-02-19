Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WG4DH-0000mh-Ug
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 05:17:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WG4DA-0000lw-P8
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 05:17:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WG4D4-0008Hs-NE
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 05:17:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WG4D4-0008Ha-F6; Wed, 19 Feb 2014 05:16:58 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1JAGvkT030629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Feb 2014 05:16:57 -0500
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-75.ams2.redhat.com
	[10.36.116.75])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1JAGtsD024838; Wed, 19 Feb 2014 05:16:55 -0500
Message-ID: <53048497.1060701@redhat.com>
Date: Wed, 19 Feb 2014 11:16:55 +0100
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131118 Thunderbird/17.0.11
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1392786705-9730-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/2] bswap: Clean prototypes of st*
	functions
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
X-List-Received-Date: Wed, 19 Feb 2014 10:17:10 -0000

On 02/19/14 06:11, Stefan Weil wrote:
> These modifications avoid type conversions for non optimized code.
> 
> ld* function prototypes will follow later.
> 
> [PATCH 1/2] bswap: Modify prototype of stb_p (avoid type
> [PATCH 2/2] bswap: Modify prototypes of st[wl]_{le,be}_p (avoid type
> 

It probably wouldn't hurt to audit all call sites, but it does look
reasonable.

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

