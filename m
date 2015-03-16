Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXZWj-0005RK-5s
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 14:14:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1YXZWh-0005P6-3Q
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 14:14:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1YXZWf-0003FK-LR
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 14:14:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1YXZWa-0003EB-UT; Mon, 16 Mar 2015 14:14:01 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2GIDx6v030855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Mar 2015 14:14:00 -0400
Received: from localhost (ovpn-113-187.phx2.redhat.com [10.3.113.187])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2GIDwaG020673; Mon, 16 Mar 2015 14:13:59 -0400
Date: Mon, 16 Mar 2015 15:13:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20150316181357.GK3513@thinpad.lan.raisama.net>
References: <1426527232-15044-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426527232-15044-1-git-send-email-armbru@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH] qdev: Make -device FOO,
 help help again when FOO is not pluggable
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
X-List-Received-Date: Mon, 16 Mar 2015 18:14:08 -0000

On Mon, Mar 16, 2015 at 06:33:52PM +0100, Markus Armbruster wrote:
> Doesn't work since commit 31bed55 changed qdev_device_help() to reject
> abstract devices and devices that have
> cannot_instantiate_with_device_add_yet set.
> 
> The former makes sense: abstract devices are purely internal, and the
> implementation of the help feature can't cope with them.
> 
> The latter makes less sense: the implementation works fine, and even
> though you can't -device such a device, the help may still be useful
> elsewhere, for instance with -global.
> 
> Revert the latter by moving the cannot_instantiate_with_device_add_yet
> check back to the other caller of qdev_get_device_class(),
> qdev_device_add().

This reintroduces the following crash:

  $ ./x86_64-softmmu/qemu-system-x86_64    -device host-x86_64-cpu,help
  qemu-system-x86_64: /home/ehabkost/rh/proj/virt/qemu/target-i386/cpu.c:1391: host_x86_cpu_initfn: Assertion `(kvm_allowed)' failed.
  Aborted (core dumped)

And this (which is not x86-specific because other arches also call
cpu_exec_init() inside instance_init):

  $ ./x86_64-softmmu/qemu-system-x86_64    -monitor stdio
  QEMU 2.2.50 monitor - type 'help' for more information
  (qemu) device_add Nehalem-x86_64-cpu,help
  Nehalem-x86_64-cpu.filtered-features=X86CPUFeatureWordInfo
  Nehalem-x86_64-cpu.feature-words=X86CPUFeatureWordInfo
  Nehalem-x86_64-cpu.apic-id=int
  Nehalem-x86_64-cpu.tsc-frequency=int
  Nehalem-x86_64-cpu.model-id=string
  Nehalem-x86_64-cpu.vendor=string
  Nehalem-x86_64-cpu.xlevel=int
  Nehalem-x86_64-cpu.level=int
  Nehalem-x86_64-cpu.stepping=int
  Nehalem-x86_64-cpu.model=int
  Nehalem-x86_64-cpu.family=int
  Nehalem-x86_64-cpu.kvm=bool
  Nehalem-x86_64-cpu.enforce=bool
  Nehalem-x86_64-cpu.check=bool
  Nehalem-x86_64-cpu.hv-time=bool
  Nehalem-x86_64-cpu.hv-vapic=bool
  Nehalem-x86_64-cpu.hv-relaxed=bool
  Nehalem-x86_64-cpu.hv-spinlocks=int
  Nehalem-x86_64-cpu.pmu=bool
  (qemu) Segmentation fault (core dumped)

Should we:

1) Live with the crashes until we move all code with side-effects outside
   instance_init (including bot not limited to cpu_exec_init() calls on most
   CPU classes);
2) add a "instance_init_is_unsafe" flag to those classes classes; or
3) Keep the current code until we fix the classes that have unsafe
   instance_init functions?

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qdev-monitor.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index 5d30ac5..b0b8cf1 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -180,10 +180,14 @@ static const char *find_typename_by_alias(const char *alias)
>      return NULL;
>  }
>  
> +
> +/**
> + * Return DeviceClass for concrete device type @driver.
> + * On error, store an error through @errp if non-null, and return %NULL.
> + */
>  static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>  {
>      ObjectClass *oc;
> -    DeviceClass *dc;
>  
>      oc = object_class_by_name(*driver);
>      if (!oc) {
> @@ -206,15 +210,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
>          return NULL;
>      }
>  
> -    dc = DEVICE_CLASS(oc);
> -    if (dc->cannot_instantiate_with_device_add_yet ||
> -        (qdev_hotplug && !dc->hotpluggable)) {
> -        error_set(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
> -                  "pluggable device type");
> -        return NULL;
> -    }
> -
> -    return dc;
> +    return DEVICE_CLASS(oc);
>  }
>  
>  
> @@ -512,6 +508,12 @@ DeviceState *qdev_device_add(QemuOpts *opts)
>          error_free(err);
>          return NULL;
>      }
> +    if (dc->cannot_instantiate_with_device_add_yet ||
> +        (qdev_hotplug && !dc->hotpluggable)) {
> +        qerror_report(QERR_INVALID_PARAMETER_VALUE, "driver",
> +                      "pluggable device type");
> +        return NULL;
> +    }
>  
>      /* find bus */
>      path = qemu_opt_get(opts, "bus");
> -- 
> 1.9.3
> 

-- 
Eduardo

