Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZYsdo-0005S9-5K
	for mharc-qemu-trivial@gnu.org; Mon, 07 Sep 2015 05:23:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYsdi-0005Je-IU
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYsdd-0002Ww-Aw
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:23:02 -0400
Received: from mail-vk0-f45.google.com ([209.85.213.45]:33519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZYsdd-0002Wp-7k
	for qemu-trivial@nongnu.org; Mon, 07 Sep 2015 05:22:57 -0400
Received: by vkbf67 with SMTP id f67so40221413vkb.0
	for <qemu-trivial@nongnu.org>; Mon, 07 Sep 2015 02:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MgoHL7VThrQLdTBoeJ53t1owS8pxjhqwgSRk4d0jr6Y=;
	b=h8KJARcIXBnJWQnbtRHOvSJiHmr5dN5EHWZaMEl0rwAXWuq0blYdxZkrdYpd6HusA0
	U9lmVkIFn45hsdEfVeAUIoDEcxjxkQmI5KgP0t8Zk+RUQbyFc5DajTX3+qq5/0hXi9hH
	ComPCCxzX1F9F2+zo5lGSKoAdM5HU5oHtKmRnSXBKcNC808cm6iBpfU8Bgy0zHTGxvJo
	7z/mwmKDd1EBMRvZxz2vd4bpNr4WJq4TC6cBkPnpdcWDhKSllXVmFRaqytHokTsUQkhp
	i85swJhMNpWJukimnJuByiC4Re2YSvSBHYzm0SesdkxVloKlNx12P0hSe/HLUaGtYmvo
	Bm7A==
X-Gm-Message-State: ALoCoQn7B9h3XSs3b4CiTiaQa+V0Ah5WlpobBGXFm2YndiLma4cma/3br+BbqxqqsifaW44MsbYN
X-Received: by 10.52.74.1 with SMTP id p1mr24008120vdv.1.1441617776950; Mon,
	07 Sep 2015 02:22:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Mon, 7 Sep 2015 02:22:37 -0700 (PDT)
In-Reply-To: <1441612292-14845-1-git-send-email-pbonzini@redhat.com>
References: <1441612292-14845-1-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Sep 2015 10:22:37 +0100
Message-ID: <CAFEAcA921SoB9wj79tm7OLrFfV_sZLy90NYOuePSdQ60GttJ5g@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
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
X-List-Received-Date: Mon, 07 Sep 2015 09:23:03 -0000

On 7 September 2015 at 08:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Coccinelle chokes on some idioms from compiler.h and queue.h.
> Extract those in a macro file, to be used with "--macro-file
> scripts/cocci-macro-file.h".

Can we put the "how to use this" instructions in the file
itself as well as in the commit message, please?

thanks
-- PMM

