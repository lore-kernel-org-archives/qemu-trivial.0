Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VdqLj-0002w0-Ry
	for mharc-qemu-trivial@gnu.org; Tue, 05 Nov 2013 18:47:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1VdqLb-0002in-KM
	for qemu-trivial@nongnu.org; Tue, 05 Nov 2013 18:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1VdqLV-0006wo-Lu
	for qemu-trivial@nongnu.org; Tue, 05 Nov 2013 18:47:47 -0500
Received: from mx1.redhat.com ([209.132.183.28]:12971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1VdqLJ-0006uQ-8d; Tue, 05 Nov 2013 18:47:29 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rA5NlSsJ023967
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 5 Nov 2013 18:47:28 -0500
Received: from colepc.home (ovpn-113-128.phx2.redhat.com [10.3.113.128])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rA5NlRWf008037; Tue, 5 Nov 2013 18:47:27 -0500
Message-ID: <5279838F.8060008@redhat.com>
Date: Tue, 05 Nov 2013 18:47:27 -0500
From: Cole Robinson <crobinso@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1d038bb1867cd9c72ba555ab40d4c891df71c5f5.1381506642.git.crobinso@redhat.com>
In-Reply-To: <1d038bb1867cd9c72ba555ab40d4c891df71c5f5.1381506642.git.crobinso@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, armbru@redhat.com,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v2] pci-assign: Fix error_report of
	pci-stub message
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
X-List-Received-Date: Tue, 05 Nov 2013 23:47:54 -0000

cc-ing qemu-trivial since this hasn't been picked up yet AFAICT.

- Cole

On 10/11/2013 11:52 AM, Cole Robinson wrote:
> Using multiple calls to error_report here means every line is
> prefaced with the (potentially long) pci-assign command line
> arguments.
> 
> Use a single error_printf to preserve the intended formatting.
> Since this code path is always preceded by an error_report call,
> we don't lose the command line reporting.
> 
> Signed-off-by: Cole Robinson <crobinso@redhat.com>
> ---
> 
> v2: Switch to error_printf
> 
>  hw/i386/kvm/pci-assign.c | 36 ++++++++++++++++--------------------
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
> index 5618173..f013a1c 100644
> --- a/hw/i386/kvm/pci-assign.c
> +++ b/hw/i386/kvm/pci-assign.c
> @@ -791,26 +791,22 @@ static void assign_failed_examine(AssignedDevice *dev)
>          goto fail;
>      }
>  
> -    error_report("*** The driver '%s' is occupying your device "
> -                 "%04x:%02x:%02x.%x.",
> -                 ns, dev->host.domain, dev->host.bus, dev->host.slot,
> -                 dev->host.function);
> -    error_report("***");
> -    error_report("*** You can try the following commands to free it:");
> -    error_report("***");
> -    error_report("*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/"
> -                 "new_id", vendor_id, device_id);
> -    error_report("*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
> -                 "%s/unbind",
> -                 dev->host.domain, dev->host.bus, dev->host.slot,
> -                 dev->host.function, ns);
> -    error_report("*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
> -                 "pci-stub/bind",
> -                 dev->host.domain, dev->host.bus, dev->host.slot,
> -                 dev->host.function);
> -    error_report("*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub"
> -                 "/remove_id", vendor_id, device_id);
> -    error_report("***");
> +    error_printf("*** The driver '%s' is occupying your device "
> +        "%04x:%02x:%02x.%x.\n"
> +        "***\n"
> +        "*** You can try the following commands to free it:\n"
> +        "***\n"
> +        "*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/new_id\n"
> +        "*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/%s/unbind\n"
> +        "*** $ echo \"%04x:%02x:%02x.%x\" > /sys/bus/pci/drivers/"
> +        "pci-stub/bind\n"
> +        "*** $ echo \"%04x %04x\" > /sys/bus/pci/drivers/pci-stub/remove_id\n"
> +        "***",
> +        ns, dev->host.domain, dev->host.bus, dev->host.slot,
> +        dev->host.function, vendor_id, device_id,
> +        dev->host.domain, dev->host.bus, dev->host.slot, dev->host.function,
> +        ns, dev->host.domain, dev->host.bus, dev->host.slot,
> +        dev->host.function, vendor_id, device_id);
>  
>      return;
>  
> 


