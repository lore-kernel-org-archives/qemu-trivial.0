Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvnVp-0008Dx-Af
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 06:20:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvnVm-00085Y-9Z
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:19:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TvnVl-0001Jn-6J
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 06:19:58 -0500
Received: from mail-wg0-f48.google.com ([74.125.82.48]:53127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TvnVi-0001J1-Jf; Thu, 17 Jan 2013 06:19:54 -0500
Received: by mail-wg0-f48.google.com with SMTP id 16so648421wgi.3
	for <multiple recipients>; Thu, 17 Jan 2013 03:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=s3QHsdOs4r7dDGIF1gZCM+6g0zN/KioamqIdSpbroVI=;
	b=Q+jYgTY/ieA0Q6lFTaaAz6IZZpePZtPwA2kMcIsWWZVwao3Uctb9q2d5HDBAt0LKom
	0+g+2fzockOaEWgs0tkoMrY0uNg6umdLalEJkb2YI1sVV3wAgEmsZFVW8zZ3APYsZH7G
	XLUdqGw04HCEa6RcUs1giz2immIFqmMiX2VrhBhloG5wA+SouZjVo7bcXnhHJB6mWpjE
	whzM9ybSBZGgxeGbm14VFTP1dceaVDi5GDhNWsZGcm5iK+mBgjTFuucgf4O4zbnwSVO9
	Tts/OlRqBVP7HARTltJncJGuSKa7dId6eqcJ9k1TJP1n6ptmsYUip2uRR1isa+X688nv
	K34Q==
X-Received: by 10.180.99.227 with SMTP id et3mr7460592wib.6.1358421593768;
	Thu, 17 Jan 2013 03:19:53 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id g2sm1838573wiy.0.2013.01.17.03.19.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 03:19:53 -0800 (PST)
Date: Thu, 17 Jan 2013 12:19:51 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20130117111951.GH2586@stefanha-thinkpad.redhat.com>
References: <1358357540-29862-1-git-send-email-armbru@redhat.com>
	<1358357540-29862-4-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358357540-29862-4-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.48
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 03/11] hw/9pfs: Fix
 unchecked strdup() by converting to g_strdup()
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
X-List-Received-Date: Thu, 17 Jan 2013 11:19:59 -0000

On Wed, Jan 16, 2013 at 06:32:12PM +0100, Markus Armbruster wrote:
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index 6eab7f7..74155fb 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -94,7 +94,7 @@ VirtIODevice *virtio_9p_init(DeviceState *dev, V9fsConf *conf)
>          exit(1);
>      }
>  
> -    s->tag = strdup(conf->tag);
> +    s->tag = g_strdup(conf->tag);
>      s->ctx.uid = -1;
>  
>      s->ops = fse->ops;

s->tag is leaked.  Want to send a follow-up patch to g_free() it?

