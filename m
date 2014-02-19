Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WG3Ar-0003dZ-Ty
	for mharc-qemu-trivial@gnu.org; Wed, 19 Feb 2014 04:10:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WG3Aj-0003W9-Oe
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 04:10:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WG3Ad-0005Ql-Uc
	for qemu-trivial@nongnu.org; Wed, 19 Feb 2014 04:10:29 -0500
Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235]:44088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WG3AS-0005O4-6g; Wed, 19 Feb 2014 04:10:12 -0500
Received: by mail-qa0-f53.google.com with SMTP id cm18so103916qab.12
	for <multiple recipients>; Wed, 19 Feb 2014 01:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=2mzaKdtN6z7P7jma+8XGOVStIew5JNEx6r0zB6Gazg4=;
	b=XjtC8wSUDY1xcJlGEt2QYCf7X+SJq0MTPhv9Psv4z0WgxzJBPV97I0isicsmLVc6g9
	6OhLUsTFR47y8pQiVVmas1LzR0VOEOC7ScBsdVIBuNNxvTgo9+eur6sdIdqXwVDfiTU0
	UNMaG9Q2ZywJmi9l7XZetLfGn9oWARbC3uIeQWkXYBvqlPMJyaU+tBpWix+DnusX60UR
	D+pxfOetqv/WA2AKDLhpJ3bUJ84JSSrmN0wB9yxyHbLiNgPQpXta+9cK/suZhvLSZn+T
	pQ49IesNKb4ebgikx3ONv6Mj+JO5x6pHWNoQugeU8vh82SWYgm17tr1qNTFMmCYRvWVR
	bqbQ==
X-Received: by 10.140.94.74 with SMTP id f68mr46406847qge.64.1392801011904;
	Wed, 19 Feb 2014 01:10:11 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id a5sm63843439qae.2.2014.02.19.01.10.09
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 01:10:11 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <530474F0.5000101@redhat.com>
Date: Wed, 19 Feb 2014 10:10:08 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1392763356-29026-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1392763356-29026-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::235
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] object: Report type in error when not
	user creatable.
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
X-List-Received-Date: Wed, 19 Feb 2014 09:10:35 -0000

Il 18/02/2014 23:42, Hani Benhabiles ha scritto:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  qmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qmp.c b/qmp.c
> index d0d98e7..f556a04 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -556,8 +556,8 @@ void object_add(const char *type, const char *id, const QDict *qdict,
>      }
>
>      if (!object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
> -        error_setg(&local_err, "object '%s' isn't supported by object-add",
> -                   id);
> +        error_setg(&local_err, "object type '%s' isn't supported by object-add",
> +                   type);
>          goto out;
>      }
>
>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

