Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TE0CB-0004ql-He
	for mharc-qemu-trivial@gnu.org; Tue, 18 Sep 2012 11:58:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1TE0C5-0004YP-H5
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 11:58:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1TE0C1-0004Wk-Br
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 11:58:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:17962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1TE0Bl-0004SD-SY; Tue, 18 Sep 2012 11:58:18 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8IFwGcV029695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Sep 2012 11:58:16 -0400
Received: from nial.usersys.redhat.com (dhcp-1-247.brq.redhat.com
	[10.34.1.247])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8IFwFJ7004265; Tue, 18 Sep 2012 11:58:15 -0400
Date: Tue, 18 Sep 2012 17:58:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20120918175814.1aa12a4c@nial.usersys.redhat.com>
In-Reply-To: <1346879185-19299-1-git-send-email-imammedo@redhat.com>
References: <1346879185-19299-1-git-send-email-imammedo@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/5 v3] convert
 system_powerdown command to notifiers
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
X-List-Received-Date: Tue, 18 Sep 2012 15:58:42 -0000

On Wed,  5 Sep 2012 23:06:20 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

ping

> global variable qemu_system_powerdown in sysemu.h is the only dep for
> qemu_irq and qemu_rise_irq is not a generic way to signal guest that it
> should shutdown.
> 
> replace it by notifiers and allow each implementation to have it's own way
> to notify guest.
> 
> git repo for testing:
>     https://github.com/imammedo/qemu/tree/shutdown_notifier.v3
> 
> compile tested:
>    target-list=x86_64-linux-user,x86_64-softmmu,sparc-softmmu,arm-softmmu
> runtime tested:
>    x86_64-softmmu + win7 guest
> 
> v3-v2:
>     - fixed bisectably issues of series
>     - make series independed of cpu_as_device series
>  
> Igor Mammedov (5):
>   Introduce powerdown_notifiers
>   acpi: use notifier for signaling guest system_powerdown command
>   target-arm: use notifier for signaling guest system_powerdown command
>   target-sparc: use notifier for signaling guest system_powerdown
>     command
>   Cleanup unused global var qemu_system_powerdown
> 
>  hw/acpi_piix4.c |  8 +++++---
>  hw/nseries.c    | 14 +++++++++++++-
>  hw/sun4m.c      | 14 +++++++++++++-
>  sysemu.h        |  2 +-
>  vl.c            | 18 ++++++++++++++----
>  5 files changed, 46 insertions(+), 10 deletions(-)
> 


