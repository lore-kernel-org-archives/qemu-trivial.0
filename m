Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJgLA-0000c2-Ew
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 05:04:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VJfVr-0000Sy-Vt
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 04:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1VJfVn-00006a-AU
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 04:10:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1VJfVm-00006U-K8; Wed, 11 Sep 2013 04:10:55 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8B8AqIq010608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Sep 2013 04:10:52 -0400
Received: from nial.usersys.redhat.com (dhcp-1-126.brq.redhat.com
	[10.34.1.126])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8B8Aorl012075; Wed, 11 Sep 2013 04:10:51 -0400
Date: Wed, 11 Sep 2013 10:10:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20130911101022.2841cad3@nial.usersys.redhat.com>
In-Reply-To: <1378830978-27578-1-git-send-email-anthony.perard@citrix.com>
References: <1378830978-27578-1-git-send-email-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 11 Sep 2013 05:03:58 -0400
Cc: qemu-trivial@nongnu.org, QEMU-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix IO port number
 for CPU present bitmap.
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
X-List-Received-Date: Wed, 11 Sep 2013 08:11:04 -0000

On Tue, 10 Sep 2013 17:36:18 +0100
Anthony PERARD <anthony.perard@citrix.com> wrote:

> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  docs/specs/acpi_cpu_hotplug.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.txt
> index 5dec0c5..f6f5774 100644
> --- a/docs/specs/acpi_cpu_hotplug.txt
> +++ b/docs/specs/acpi_cpu_hotplug.txt
> @@ -10,7 +10,7 @@ ACPI GPE block (IO ports 0xafe0-0xafe3, byte access):
>  Generic ACPI GPE block. Bit 2 (GPE.2) used to notify CPU
>  hot-add/remove event to ACPI BIOS, via SCI interrupt.
>  
> -CPU present bitmap (IO port 0xaf00-0xae1f, 1-byte access):
> +CPU present bitmap (IO port 0xaf00-0xaf1f, 1-byte access):
>  ---------------------------------------------------------------
>  One bit per CPU. Bit position reflects corresponding CPU APIC ID.
>  Read-only.

Reviewd-By: Igor Mammedov <imammedo@redhat.com>

