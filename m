Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjTqi-0006nu-Fr
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 08:26:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UjTqc-0006ge-SM
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UjTqY-0002Yy-6T
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 08:26:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UjTqN-0002Ww-NF; Mon, 03 Jun 2013 08:26:35 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r53CQYpZ020287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 3 Jun 2013 08:26:34 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-49.ams2.redhat.com
	[10.36.112.49])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r53CQVFd001872; Mon, 3 Jun 2013 08:26:32 -0400
Message-ID: <51AC8B6D.7090202@redhat.com>
Date: Mon, 03 Jun 2013 14:26:21 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com
References: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1370237352.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v1 0/3]  Memory: Trivial fixes
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
X-List-Received-Date: Mon, 03 Jun 2013 12:26:55 -0000

Il 03/06/2013 07:31, peter.crosthwaite@xilinx.com ha scritto:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> Some trivial fixes to memory API.
> 
> 
> Peter Crosthwaite (3):
>   memory: Fix comment typo
>   memory: as_update_topology_pass: Improve comments
>   memory: render_memory_region: factor out fr constant setters
> 
>  memory.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 

Thanks, applying to my iommu branch.

