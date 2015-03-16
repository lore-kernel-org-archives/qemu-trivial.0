Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXYwy-0000FM-DO
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 13:37:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXYwv-0000DT-Qt
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 13:37:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YXYwr-0006GO-Jk
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 13:37:09 -0400
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a]:34940)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YXYwr-0006GF-DR; Mon, 16 Mar 2015 13:37:05 -0400
Received: by wibdy8 with SMTP id dy8so43697561wib.0;
	Mon, 16 Mar 2015 10:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=RJ66w+WSCPzZv1A67yF5w2bEU4Ol9BHCUzfCyr7C8Zo=;
	b=jJOVYVQ60Zx/MG8kOHMAvYVwFKfGmMXSu9shXEplNrCpHbidy0FfESXjx4vTT55xTs
	xzrkn4ZF7TOw0gEDtEbcsAa1jDz0QH3XVFDWKb3wTKYgBoyeVQs+3MmBftnZ1tcpQOUi
	oSlSIYsaiOlgp4kMlLkBRT2+1MyRtWWFsQpgeHbUdXAV0CZYFiBHB/Qvd6rlYdtSmwrT
	STmdA+CPxdPI8s1xiwhxF/Om8xAT4Mr949rfrl+65xHUc6smqjdJlzAsaE8CuI52+MIC
	m4adBGSdgUIf/+d2c+27Wlh3qBQ/iSsw3+tncBhXK7ldoIvcLXdRINHn8lwvvaNlEhdx
	v26A==
X-Received: by 10.180.100.227 with SMTP id fb3mr5697325wib.81.1426527424736;
	Mon, 16 Mar 2015 10:37:04 -0700 (PDT)
Received: from [192.168.10.165] (net-188-216-23-124.cust.vodafonedsl.it.
	[188.216.23.124]) by mx.google.com with ESMTPSA id
	ga8sm16283235wib.11.2015.03.16.10.37.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Mar 2015 10:37:03 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <550714BC.3090101@redhat.com>
Date: Mon, 16 Mar 2015 18:37:00 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1426527232-15044-1-git-send-email-armbru@redhat.com>
In-Reply-To: <1426527232-15044-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22a
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, afaerber@suse.de
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
X-List-Received-Date: Mon, 16 Mar 2015 17:37:10 -0000



On 16/03/2015 18:33, Markus Armbruster wrote:
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
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Cc: qemu-stable@nongnu.org

I'm picking this patch up.  It will miss -rc0, but I'll send my next
pull request before -rc1.

Paolo

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
> 

