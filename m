Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSp3E-0008RR-Hu
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 07:02:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RSp39-00089V-Ga
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 07:02:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1RSp33-0003Rf-Q4
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 07:02:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1RSp2y-0003Qe-6v; Tue, 22 Nov 2011 07:01:56 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pAMC1sd5019391
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 22 Nov 2011 07:01:54 -0500
Received: from doriath (ovpn-113-90.phx2.redhat.com [10.3.113.90])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pAMC1qTB005257; Tue, 22 Nov 2011 07:01:52 -0500
Date: Tue, 22 Nov 2011 10:01:51 -0200
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Message-ID: <20111122100151.02be07cd@doriath>
In-Reply-To: <1321956386-12004-4-git-send-email-wdongxu@linux.vnet.ibm.com>
References: <1321956386-12004-1-git-send-email-wdongxu@linux.vnet.ibm.com>
	<1321956386-12004-4-git-send-email-wdongxu@linux.vnet.ibm.com>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH 04/11] fix spelling in QMP sub directory
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
X-List-Received-Date: Tue, 22 Nov 2011 12:02:10 -0000

On Tue, 22 Nov 2011 18:06:19 +0800
Dong Xu Wang <wdongxu@linux.vnet.ibm.com> wrote:

> From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> 
> 
> Cc: Luiz Capitulino <lcapitulino@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>

Acked-by: Luiz Capitulino <lcapitulino@redhat.com>

> ---
>  QMP/qmp-events.txt |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/QMP/qmp-events.txt b/QMP/qmp-events.txt
> index 0ce5d4e..af586ec 100644
> --- a/QMP/qmp-events.txt
> +++ b/QMP/qmp-events.txt
> @@ -126,7 +126,7 @@ the authentication ID is not provided.
>  VNC_DISCONNECTED
>  ----------------
>  
> -Emitted when the conection is closed.
> +Emitted when the connection is closed.
>  
>  Data:
>  


