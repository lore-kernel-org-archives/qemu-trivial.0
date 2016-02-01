Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQE0V-0003gq-0h
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 07:55:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aQE0T-0003gY-FG
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 07:55:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aQE0Q-0006Fr-5s
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 07:55:01 -0500
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:34102)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aQE0P-0006Fl-VE; Mon, 01 Feb 2016 07:54:58 -0500
Received: by mail-pa0-x244.google.com with SMTP id yy13so7183363pab.1;
	Mon, 01 Feb 2016 04:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lzNo7qbwYqh2pXz1K4f9IjodhTYMdvbogAL5rdaTWSA=;
	b=NLOT2uxerZl3FAsx+1+lBiWvWcJ0SCwDo446aMbXd2/aaTDwyT0yHHuIE1I1ryKXI/
	Tk8wXnDip1/SimxImchNYyOxotz6tECX3AL2TvFnPZU/Oig7LMb9i6SbfXU+mCf/1pPG
	QH6eQmTWrL5UkSsB1jrQd+kKtG/A46WuIZHgz1ffApNBjzYXJQuBrgrwrq+fF7jzik5K
	HsLDif+rP6slwBn0frpP4wTNmVRoRVZBHeLv/3uRpT0CDqnbgDLhAUkoTrppBtuCEvMg
	uUcGyvi08ihGHZNgR6K8Ej/ReMR5SzdJbbn7X+QEHjbDJ5wuutjOclXDe57lFMwZoyFs
	HF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=lzNo7qbwYqh2pXz1K4f9IjodhTYMdvbogAL5rdaTWSA=;
	b=UwIT9Gt888Ngr+fzPbAC/k9pn8aXZuKCVFRE1IqTPTMnAd5rn1uc9AYJ1VNhFD0YUN
	qtA3K7YUnnJn4P0q7U46tMH3Ab5fwzURMnLD/ex3RAkiau4SraVdSh4exrfV+0hvmo+g
	wgKhWTfSIiL33g3Y+fnd6/mZLlvE9UtKqoIra5aVJg/aDPKjq/iWGeo6WG0LM9p3LiK+
	Weyppo8008tzJ+yiyBkEIV8mDnVv+GNfj26K4M/VOjSV/xwFm6juC5PIUtfUfLOJKpuD
	cKktFhOxOrLQ0XdUy4T5vUqXMYvKPHu+0Xll7aW/DJm/f2UzxBBi2xacz+FKYKmF4x4y
	pGsg==
X-Gm-Message-State: AG10YOR8PEdz/VP1ApJM7Q6RGSEtVibUQqm9YMiDvfAko6nTHgg4sE21OwDp7VWRaFYpgA==
X-Received: by 10.66.120.200 with SMTP id le8mr38272159pab.61.1454331297073;
	Mon, 01 Feb 2016 04:54:57 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	fl9sm41266855pab.30.2016.02.01.04.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 04:54:55 -0800 (PST)
Date: Mon, 1 Feb 2016 12:54:53 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160201125453.GB18246@vultr.guest>
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
	<56AC8637.20304@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56AC8637.20304@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com,
	qemu-devel <qemu-devel@nongnu.org>, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] rdma: remove check on time_spent
	when calculating mbs
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Feb 2016 12:55:02 -0000

On Sat, Jan 30, 2016 at 12:45:27PM +0300, Michael Tokarev wrote:
>24.01.2016 17:09, Wei Yang wrote:
>> Within the if statement, time_spent is assured to be non-zero.
>> 
>> This patch just removes the check on time_spent when calculating mbs.
>
>The if statement is this one:
>
>        if (current_time >= initial_time + BUFFER_DELAY) {
>
>Note that we use time_spent as a divisor to calculate
>bandwidth too.
>
>This is indeed a trivial patch, I'm applying it to -trivial,
>but please the next time post it to qemu-devel (the main
>mailinglist), and Cc qemu-trivial if it is trivial.
>

To Amit and Michael,

Yep, thanks. I thought these two are too trivial to post to qemu-devel :)

Will do this next time.

>Thanks!
>
>/mjt
>
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  migration/migration.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index c842499..40b87f2 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1677,8 +1677,8 @@ static void *migration_thread(void *opaque)
>>              double bandwidth = (double)transferred_bytes / time_spent;
>>              max_size = bandwidth * migrate_max_downtime() / 1000000;
>>  
>> -            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
>> -                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
>> +            s->mbps = (((double) transferred_bytes * 8.0) /
>> +                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
>>  
>>              trace_migrate_transferred(transferred_bytes, time_spent,
>>                                        bandwidth, max_size);
>> 

-- 
Wei Yang
Help you, Help me

