Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f0XCd-0003Qz-75
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2018 14:50:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0XCa-0003PV-BM
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 14:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0XCX-0006Ud-5S
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2018 14:50:40 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:45094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f0XCX-0006Tq-18; Mon, 26 Mar 2018 14:50:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id f8so20668255qtg.12;
	Mon, 26 Mar 2018 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=X5ZAGHsITHVEFHIex9Je8HNiNqAsgzeRBNo0LbysFOY=;
	b=ZZWn7gj+TEKC9aGQ/ifk1l+RppVKVW/nx05vJxcqZK8lr5NRsq5vrIyLw1vC3Id+pA
	Cd3dvfKfPBTVxdvYT9y2oo5EP9Cr6q2H6Tp0bNbhpmS0/C396BnMZePwHdsBdQEAT1uX
	DsFJ0iHqROY29Ug94mozikf4q+LQZRzSz5fxq49bbZvddsqRkZCNFm5x2Dkxj8OWhHC5
	yf0bkIo2v2/nPu2plkiVW+v4BXNpjh/I5S6FR1jgcrTeQiLulgG1dlUVuc7It4+cVuJH
	466uPnR2/3dlcbhMIFAJ9e7AbhETPqYzMfYPxateOygM6B8Bt5zVrgwEtYyWt7hDrJzA
	0u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=X5ZAGHsITHVEFHIex9Je8HNiNqAsgzeRBNo0LbysFOY=;
	b=uiK+j+wPW/4PIJYwmGGMZto7v2JS4FOMShGl8JI50m/em5V6FwwS6p7CCyhLKO5yCx
	MN7h6QJx8FT4+7pBlkm163FzE5YqFe87+Du5+9H9iLZHmH7f+rOMsg+NPKeiBkfZE/5H
	ZqDdsTCHcI3pcoq13Ft5/mJLuBLpyENu9MJ1xJznsClCh771ZT6okHWj1+iggvwfHgpA
	79Cgulf8u0C7CgJThW+lvIUU6296OkAsSfq7f2AVOAfDOAhl3DZaxNLQFNLTZnoPaf70
	YA+R6G2VOQqFsx00yoZE5IzNkocKYgcFI7lODDePB96W+dbK6K3a/Ooan02Ea3wceCqs
	Ze3w==
X-Gm-Message-State: AElRT7HnKai7OO7qPjDoCk+ZFqtsL7MNYt5SZfDCEGuIvX8TLIMZeJDP
	SyAxDsadKZQkYXbuoaEY2G4=
X-Google-Smtp-Source: AG47ELvDdSaUgrUP+Bf2UP6nV7iO0fhDOW1CjbBA+HH/rliO9dcI6DfozKZpPJRcXLjIFuyNGOigGA==
X-Received: by 10.200.52.155 with SMTP id w27mr59437032qtb.244.1522090236381; 
	Mon, 26 Mar 2018 11:50:36 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	l192sm6653636qke.56.2018.03.26.11.50.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Mar 2018 11:50:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20180326184147.1565719-1-eblake@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <2e720753-9bce-014b-c550-11486ea38051@amsat.org>
Date: Mon, 26 Mar 2018 15:50:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180326184147.1565719-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH for-2.12] maint: Add .mailmap entries for
 patches claiming list authorship
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Mar 2018 18:50:41 -0000

On 03/26/2018 03:41 PM, Eric Blake wrote:
> The list did not author any patches, but it does rewrite the
> 'From:' header of messages sent from any domain with restrictive
> SPF policies that would otherwise prevent the message from reaching
> all list recipients.  If a maintainer is not careful to undo the
> list header rewrite, and the author did not include a manual
> 'From:' line in the body to fix the munged header, then 'git am'
> happily attributes the patch to the list.  Add some mailmap
> entries to correct the few that have escaped our attention; while
> we also work on improving the tooling to catch the problem in
> the future before a merge is even made.

Thanks!

> 
> Also improve the comments occurring in the file, including line
> length improvements.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
> Probably worth inclusion in 2.12-rc1, since it makes statistics
> about the release easier to follow.
> 
>  .mailmap | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index cf689b9ec99..b02c357e9a1 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -1,6 +1,7 @@
> -# This mailmap just translates the weird addresses from the original import into git
> -# into proper addresses so that they are counted properly in git shortlog output.
> -#
> +# This mailmap fixes up author names/addresses.
> +
> +# The first section translates weird addresses from the original git import
> +# into proper addresses so that they are counted properly by git shortlog.
>  Andrzej Zaborowski <balrogg@gmail.com> balrog <balrog@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Anthony Liguori <anthony@codemonkey.ws> aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
>  Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
> @@ -15,10 +16,19 @@ Paul Burton <paul.burton@mips.com> <paul.burton@imgtec.com>
>  Paul Burton <paul.burton@mips.com> <paul@archlinuxmips.org>
>  Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
>  malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
> +
>  # There is also a:
>  #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
>  # for the cvs2svn initialization commit e63c3dc74bf.
> -#
> +
> +# Next, translate a few commits where mailman rewrote the From: line due
> +# to strict SPF, although we prefer to avoid adding more entries like that.
> +Ed Swierk <eswierk@skyportsystems.com> Ed Swierk via Qemu-devel <qemu-devel@nongnu.org>
> +Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-devel@nongnu.org>
> +Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
> +Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>
> +
> +
>  # Also list preferred name forms where people have changed their
>  # git author config
>  Daniel P. Berrangé <berrange@redhat.com>
> 

