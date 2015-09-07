Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYvPK-0007yF-Oy
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 08:20:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYtUM-0002Dk-KL
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 06:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYtUI-0000f9-VF
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 06:17:25 -0400
Received: from mail-vk0-f51.google.com ([209.85.213.51]:35300)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYtUI-0000ey-SW
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 06:17:22 -0400
Received: by vkaw128 with SMTP id w128so40830407vka.2
	for <qemu-trivial@nongnu.org>; Mon, 07 Sep 2015 03:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t2+SYFfiuQb88CE3cDS0k8u5G8hARWuw0CnZagxAVfs=;
	b=TTW8v+yS2IwNYHnQ2yXAa2vcv/E82LEVXgF3TIMJ8Qp+5eHMFxTVmkugpVQEd9+asS
	+onbNkSDlKyRC/pL0PfTQZ6+Okml9gUoOnFn14Mn/wkK1N8buDLC1dvIpc0HYKxxY3hx
	wLiLmIe7tGb4h4exqanu32IRYW2z259MxBzuRmNZnYyhYZDFeZTs7cdBmJ1l7Y2WJ0Ix
	hZU+MgKymg1Or2rWlM7IaeWAxTJy19LTZSE66ulHujlVDFRfYVZ6Oz6eMWMw53B4iQuM
	6UmwKwTB/q/upB2TcSZomvcuQDxa365mwRozdzZnC16uGmj3KMaovXYor6GGFhJMbEid
	oelw==
X-Gm-Message-State: ALoCoQkwfxjuKwq3rNVgK72ByLmhS4j7x12l2+Ol2JvbUAo9PTnQ/4ehcTzR05Da9+MWIFz/Hb/y
X-Received: by 10.52.9.68 with SMTP id x4mr25626344vda.90.1441621042291; Mon,
	07 Sep 2015 03:17:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 7 Sep 2015 03:17:02 -0700 (PDT)
In-Reply-To: <55ED5F65.3060809@redhat.com>
References: <1441612292-14845-1-git-send-email-pbonzini@redhat.com>
	<CAFEAcA921SoB9wj79tm7OLrFfV_sZLy90NYOuePSdQ60GttJ5g@mail.gmail.com>
	<55ED5F65.3060809@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2015 11:17:02 +0100
Message-ID: <CAFEAcA_ZCV0dmNEXPthSLSRQWoKG-sc5_vQEFrBxczEhYj8s8A@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] add macro file for
	coccinelle
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
X-List-Received-Date: Mon, 07 Sep 2015 12:20:20 -0000

On 7 September 2015 at 10:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 07/09/2015 11:22, Peter Maydell wrote:
>> On 7 September 2015 at 08:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>> Coccinelle chokes on some idioms from compiler.h and queue.h.
>>> Extract those in a macro file, to be used with "--macro-file
>>> scripts/cocci-macro-file.h".
>>
>> Can we put the "how to use this" instructions in the file
>> itself as well as in the commit message, please?
>
> Like this?
>
> /* Coccinelle only does limited parsing of headers, and chokes on some idioms
>  * defined in compiler.h and queue.h.  Macros that Coccinelle must know about
>  * in order to parse .c files must be in a separate macro file---which is
>  * exactly what you're staring at now.
>  *
>  * To use this file, add the "--macro-file scripts/cocci-macro-file.h" to the
>  * Coccinelle command line.
>  */

Yeah, sounds about right.

thanks
-- PMM

