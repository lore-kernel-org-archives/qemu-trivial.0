Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkAl0-0002Lx-0a
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 07:20:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1Wk7vk-000365-Hj
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 04:19:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1Wk7vj-0007PX-OF
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 04:19:20 -0400
Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236]:53766)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>)
	id 1Wk7vf-0007O7-Vr; Tue, 13 May 2014 04:19:16 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so9597696oag.13
	for <multiple recipients>; Tue, 13 May 2014 01:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mi86hQ/jP/LmkbMeGjl5N8jOvc7peKcgLyHjKxYwazM=;
	b=hiaAcEsuAy3OUyll3Z65oa24nFlgjPr8Booan5v/vCnl795wqEWZy9Qzg1hXhHpEb5
	bN9d8Ewp985tv8Xex3KLfHZsxo/jI8BOrBLT+Mt4vlNVv/rdP4hjUB+PMZoI2CnVgV7f
	W/EfAnJcoVyMCgZ9HoBgTZjG5XaSru86glVrhx5q5kUZYTg4J0j6jPlgV0O3H60/CTyT
	PkB02e6rUHG+R0hj8+wGdNi9ha9AXgqDNOIfj6M89+N0wL4uLnvvXo5Hzr0mnVcvLGCf
	uY3Qp/jGH6e6K6LT0JyrLivXUL5ni6rHiqFJ3nGwaughiV75TQh4Nt0ol3VUk8PMRJN/
	VgOg==
MIME-Version: 1.0
X-Received: by 10.60.47.111 with SMTP id c15mr1039410oen.80.1399969154883;
	Tue, 13 May 2014 01:19:14 -0700 (PDT)
Received: by 10.76.166.164 with HTTP; Tue, 13 May 2014 01:19:14 -0700 (PDT)
In-Reply-To: <1399964954-10842-5-git-send-email-zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
	<1399964954-10842-5-git-send-email-zhen-hual@hp.com>
Date: Tue, 13 May 2014 12:19:14 +0400
Message-ID: <CAMo8Bf+nF1CXjs2VVomD0u2eNs_P6hRgUxbESHDiDb8ANriyCg@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
To: "Li, Zhen-Hua" <zhen-hual@hp.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::236
X-Mailman-Approved-At: Tue, 13 May 2014 07:20:23 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] Support more than 255
	cpus: runtime check
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
X-List-Received-Date: Tue, 13 May 2014 08:19:21 -0000

On Tue, May 13, 2014 at 11:09 AM, Li, Zhen-Hua <zhen-hual@hp.com> wrote:
> From: "Li, ZhenHua" <zhen-hual@hp.com>
>
> There is some runtime check for max cpu count. Make them support 4096 cpus.
>
> Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
> ---
>  hw/i386/acpi-build.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index c98df88..5c3bf10 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c

[...]

> @@ -680,7 +680,7 @@ build_append_notify_method(GArray *device, const char *name,
>      for (i = 0; i < count; i++) {
>          GArray *target = build_alloc_array();
>          build_append_nameseg(target, format, i);
> -        assert(i < 256); /* Fits in 1 byte */
> +        assert(i < 4096); /* Fits in 1 byte */

The comment is no longer true.
Also the function build_append_notify_method is called with format argument
set to "CP%0.02X", looks like this should be changed to "CP%0.03X".

-- 
Thanks.
-- Max

