Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WI0ku-0002pY-DO
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2014 13:59:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46670)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WI0kj-0002RV-DC
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 13:59:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WI0kb-0006oT-0g
	for qemu-trivial@nongnu.org; Mon, 24 Feb 2014 13:59:45 -0500
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229]:58713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WI0kJ-0006ie-Uz; Mon, 24 Feb 2014 13:59:20 -0500
Received: by mail-ea0-f169.google.com with SMTP id d10so2116003eaj.14
	for <multiple recipients>; Mon, 24 Feb 2014 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xBCM+Cuj743RPJVfuUDGp685MUwXki+bf1oBlHxFq9Y=;
	b=ffN2cX+OA4J+VTRwaiwwZ7SXdFTrSyVOaCRNPpNxMdaBKtSRH1z/RlKuBkOrTnG9uL
	JkUfRzmAEkGO8KgY8vh94cRycUgy30LmlZiGyy+mJ2upIucunajg99lvD+czTMeCy+F5
	e27Ks0l7xqzrnI8wyiZ2M212v0GeflCuQ2Fsw4lngIsSKjbMNJve5ts8GlTHAdysUyuw
	V/9jh4PUpWmv0K2FjjCwdlBg5Jznlpkzjl801vo9pfhukXGMA7nJbFuWHjsvXsLHoM5K
	2XgjGQ8+7NV3ZPhFkDwFtc2UKkQlqAELczKCUJJhJmxYd3QI1LS9MpHewujGUMBao7n1
	N15Q==
X-Received: by 10.15.22.65 with SMTP id e41mr26071777eeu.5.1393268358570;
	Mon, 24 Feb 2014 10:59:18 -0800 (PST)
Received: from Inspiron-3521 ([41.109.173.253])
	by mx.google.com with ESMTPSA id 46sm66937698ees.4.2014.02.24.10.59.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 10:59:17 -0800 (PST)
Date: Mon, 24 Feb 2014 19:59:14 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20140224185914.GC3855@Inspiron-3521>
References: <1393164341-7196-1-git-send-email-kroosec@gmail.com>
	<8738j86fwa.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8738j86fwa.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::229
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] balloon: Fix device name in
	error message.
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
X-List-Received-Date: Mon, 24 Feb 2014 18:59:54 -0000

On Mon, Feb 24, 2014 at 10:04:05AM +0100, Markus Armbruster wrote:
> I agree the error message is bad, but I'm afraid your patch makes it
> worse :)
> 
> qemu_balloon() returns zero when balloon_event_fn has not been set with
> qemu_add_balloon_handler().
> 
> Right now, the only device that calls qemu_add_balloon_handler() is
> virtio-balloon-device.  In theory, there could be others in the future.
> 
> virtio-balloon-device is a virtio-bus device.  The bus can be provided
> by virtio-balloon-pci or virtio-balloon-ccw.
> 
> Your error message is misleading when it's provided by the latter.
> 

I see. Sorry for not throughly understanding the whole chain yet!

I somehow missed virtio-balloon-ccw, thus my false belief that
virtio-balloon-pci would be the only one to be ever needed/used.

> Moreover, you missed qmp_query_balloon().
> 
> QERR_DEVICE_NOT_ACTIVE is also used with argument "spice", and the
> resulting error message is similarly bad.  Perhaps something like this
> would do:
> 
> #define QERR_DEVICE_NOT_ACTIVE \
>     ERROR_CLASS_DEVICE_NOT_ACTIVE, "No %s device has been activated"

Sounds good to me. Will send a patch shortly.

