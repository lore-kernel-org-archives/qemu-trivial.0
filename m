Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXQXw-0006oo-7O
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 07:20:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dXQXp-0006h6-4y
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:20:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1dXQXk-0002KS-F6
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:20:01 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:36413)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1dXQXk-0002JS-8d
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 07:19:56 -0400
Received: by mail-wr0-x22a.google.com with SMTP id y43so24422371wrd.3
	for <qemu-trivial@nongnu.org>; Tue, 18 Jul 2017 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=pWLzr6A+re61JyUDF0C9Pyhr12H9sJR2DyaFvp/RXyQ=;
	b=NjNEcLsF1CnLvwfdLMdMJ3nfXPWUKveYlaeoHVntOruvO/GXW0YHio8AXqRCipBi4D
	MRk/5+sl1yp7PcmyfzbTQcWwaWsNx3KyRCqNurQIvFXjoanR9ZPSkAbD4sVG4GFlUS4t
	8jKmaSHbWyf6CE4U2tSXTjOr4k/tMXvisHkC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=pWLzr6A+re61JyUDF0C9Pyhr12H9sJR2DyaFvp/RXyQ=;
	b=NRKzlj8K2WpqfnzpMP9zskSvKAHXV4jrGNJ7TFCJcn8IQUxJmFus8SyxuHiuy/CyyJ
	3Qt84avUbwr1utrKbF+T33gXjaOYonQQrSgLxA+RNZRforJ53t860GMupPJDaHEw8PK6
	6ynUrpi8aIYwIKSWkmMPJ2miZBO6DnWNgx3XQ5LEYp2P7Hb0ilufkmyR+H4R4AAcRXl3
	IBMWaxsigHxRrPvhvvaLS0+hY2LcdeszcFxHoqUYiNs0WgTtMoNjbMhKtdxkmjAOtkUM
	+/xqL5MHuaWsWoceHF/RgtBrCaTX/ElozzoAnYWYxSVmp3FNp6Ya6hcjVp60dDt56Xke
	B1Jg==
X-Gm-Message-State: AIVw111PfMxCSkj9Nv4l/bx3gBvD13oEYIZywlT2L+ov4LvTdhOdDZ8T
	XZXmurknIhxRnwDV
X-Received: by 10.28.113.23 with SMTP id m23mr1790049wmc.128.1500376795103;
	Tue, 18 Jul 2017 04:19:55 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	j137sm15511975wmd.18.2017.07.18.04.19.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 04:19:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7E6E13E0128;
	Tue, 18 Jul 2017 12:19:53 +0100 (BST)
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-7-f4bug@amsat.org>
	<87bmoiysko.fsf@secure.mitica>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: quintela@redhat.com
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Fam Zheng
	<famz@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, Stefan
	Hajnoczi <stefanha@redhat.com>
In-reply-to: <87bmoiysko.fsf@secure.mitica>
Date: Tue, 18 Jul 2017 12:19:53 +0100
Message-ID: <87a8428012.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 06/29] migration/block: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 11:20:07 -0000


Juan Quintela <quintela@redhat.com> writes:

> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  migration/block.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/block.c b/migration/block.c
>> index 9171f60028..498c72ad59 100644
>> --- a/migration/block.c
>> +++ b/migration/block.c
>> @@ -933,7 +933,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
>>                  ret = bdrv_get_info(blk_bs(blk), &bdi);
>>                  if (ret == 0 && bdi.cluster_size > 0 &&
>>                      bdi.cluster_size <= BLOCK_SIZE &&
>> -                    BLOCK_SIZE % bdi.cluster_size == 0) {
>> +                    QEMU_IS_ALIGNED(BLOCK_SIZE, bdi.cluster_size)) {
>>                      cluster_size = bdi.cluster_size;
>>                  } else {
>>                      cluster_size = BLOCK_SIZE;
>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
>
> Should I take this patch, or does it go through the block layer?  Your
> call.

Given it is part of a set would it not make more sense going through
-trivial with the rest of them?

--
Alex Bennée

