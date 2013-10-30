Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbaUf-0005ai-OL
	for mharc-qemu-trivial@gnu.org; Wed, 30 Oct 2013 14:27:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>) id 1VbPpV-0004Pd-Hb
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 03:04:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>) id 1VbPpU-00023e-Hw
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 03:04:37 -0400
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234]:42418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kongjianjun@gmail.com>)
	id 1VbPpP-00022D-Ua; Wed, 30 Oct 2013 03:04:32 -0400
Received: by mail-we0-f180.google.com with SMTP id q59so847317wes.39
	for <multiple recipients>; Wed, 30 Oct 2013 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S7TVyAT/j7dZez0S7GlVqd5WtcPpX1UxJIUc6VrMQ7g=;
	b=ZQD2kEEni6AE5QVwzlQ2zHzFn5rilv3+oq3WrhaBXNaTEOA6XWVgPfrwx4EA23voxf
	T6XIRn7SkcDaPgA4ZHrHzEkRyvIJynxNa4oQWqXO3vmVNOLA1ipTmJy3P++pVMRHgMsL
	ahphs44uRT4P0X9lYPLnyuHGFWJlWD6WxMWky+nuh9gNnRYqnS+4efMzJr1M8BESMSQE
	eZe/4aTaH6Le5ZW6nBUN2NpfraahhIorMAlSUYP6svIaAHigalWt8AMXrILp7LjP0cpL
	CSNYJLg3kCA7XTu272S6wJkfyxWGP6668jIFU5IBFVBn7CApPQlr4jv85SFZJtpcUGez
	LN+Q==
MIME-Version: 1.0
X-Received: by 10.180.12.198 with SMTP id a6mr1286452wic.38.1383116670459;
	Wed, 30 Oct 2013 00:04:30 -0700 (PDT)
Received: by 10.194.203.164 with HTTP; Wed, 30 Oct 2013 00:04:30 -0700 (PDT)
In-Reply-To: <1383115965-22360-1-git-send-email-akong@redhat.com>
References: <1383115965-22360-1-git-send-email-akong@redhat.com>
Date: Wed, 30 Oct 2013 15:04:30 +0800
Message-ID: <CAFeW=pYtDWzZo8CRtp_CzJFAtt4_ycZRG-45i+agEM6uz-4R=g@mail.gmail.com>
From: Amos Kong <kongjianjun@gmail.com>
To: Amos Kong <akong@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::234
X-Mailman-Approved-At: Wed, 30 Oct 2013 14:27:48 -0400
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] move BlockdevRef definition
	before using it
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
X-List-Received-Date: Wed, 30 Oct 2013 07:04:38 -0000

On Wed, Oct 30, 2013 at 2:52 PM, Amos Kong <akong@redhat.com> wrote:
>
> From: Amos Kong <kongjianjun@gmail.com>
>
> @BlockdevRef is used in @BlockdevOptionsGenericFormat and
> @BlockdevOptionsGenericCOWFormat.

NACK this patch.

@BlockdevOptions is used in @BlockdevRef, this change is meaningless.

> Signed-off-by: Amos Kong <kongjianjun@gmail.com>
> ---
>  qapi-schema.json | 34 +++++++++++++++++-----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 60f3fd1..8af8187 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -4061,6 +4061,23 @@
>              '*rw': 'bool' } }
>
>  ##
> +# @BlockdevRef
> +#
> +# Reference to a block device.
> +#
> +# @definition:      defines a new block device inline
> +# @reference:       references the ID of an existing block device. An
> +#                   empty string means that no block device should be
> +#                   referenced.
> +#
> +# Since: 1.7
> +##
> +{ 'union': 'BlockdevRef',
> +  'discriminator': {},
> +  'data': { 'definition': 'BlockdevOptions',
> +            'reference': 'str' } }
> +
> +##
>  # @BlockdevOptionsGenericFormat
>  #
>  # Driver specific block device options for image format that have no option
> @@ -4162,23 +4179,6 @@
>    } }
>
>  ##
> -# @BlockdevRef
> -#
> -# Reference to a block device.
> -#
> -# @definition:      defines a new block device inline
> -# @reference:       references the ID of an existing block device. An
> -#                   empty string means that no block device should be
> -#                   referenced.
> -#
> -# Since: 1.7
> -##
> -{ 'union': 'BlockdevRef',
> -  'discriminator': {},
> -  'data': { 'definition': 'BlockdevOptions',
> -            'reference': 'str' } }
> -
> -##
>  # @blockdev-add:
>  #
>  # Creates a new block device.
> --
> 1.8.3.1
>
>

