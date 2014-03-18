Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPqAZ-0003Pp-62
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 05:18:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqAQ-0003Eb-OG
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1WPqAK-00012G-PX
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 05:18:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1WPqA8-0000yb-Hy; Tue, 18 Mar 2014 05:18:20 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2I9IHw9025893
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 05:18:18 -0400
Received: from noname.str.redhat.com (dhcp-192-197.str.redhat.com
	[10.33.192.197])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s2I9IFqS000583; Tue, 18 Mar 2014 05:18:16 -0400
Date: Tue, 18 Mar 2014 10:18:15 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Maria Kustova <maxa@catit.be>
Message-ID: <20140318091815.GC4607@noname.str.redhat.com>
References: <1395122359-28890-1-git-send-email-maria.k@catit.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395122359-28890-1-git-send-email-maria.k@catit.be>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
	Maria Kustova <maria.k@catit.be>
Subject: Re: [Qemu-trivial] [PATCH v2 0/3] Trivial patches
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
X-List-Received-Date: Tue, 18 Mar 2014 09:18:45 -0000

Am 18.03.2014 um 06:59 hat Maria Kustova geschrieben:
> These patches are the part of OPW application.
> Two of them update help messages of qemu-io utility.
> And last one replaces fprintf() with error_setg() in curl.c
> 
> Changes v1 -> v2:
>  * Removed trailing "\n" from the error string in error_setg() call
> 
> Maria Kustova (3):
>   qemu-io-cmds: Fixed typo in example for writev.
>   block: Replaced old error handling with error reporting API.
>   qemu-io: Extended "--cmd" description in usage text

Thanks, applied patches 1 and 3 to the block branch for 2.0, and patch 2
to block-next for 2.1.

Kevin

