Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQDyB-0003UQ-DD
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 07:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aQDy9-0003Sm-I3
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 07:52:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aQDy6-0005bv-8h
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 07:52:37 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aQDy6-0005bg-1n; Mon, 01 Feb 2016 07:52:34 -0500
Received: by mail-pf0-x244.google.com with SMTP id n128so7503483pfn.3;
	Mon, 01 Feb 2016 04:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=S+AyZ0bAi304mc5VZCnGq7REC7xG1u9rMfS5iiQ4ETc=;
	b=yq5CoTJTS0ib6Qq4jdALaO15q5HqqIbI2rwfn32Rq2Ayap+ZiGM/EI9wLcxM4SQkfJ
	teh8Y5JlgHtEJ49zQghFyG2IXwb1kIHakOVFqLX0ozOXIaw8+p+xXHkUhMAAzooHPTpD
	M/8bhkHIsNp++qP9fKf4NnoGNWopbhcSGYJOCz8lwXeyVaCpEaW+6K9i2cNiMVczZiir
	gmD2jcTbpqlhKV3FLlDf1U+fNfnDCvmCkhevg9aaAUJRx+46zmkZ/qqGroineFF1zXfk
	pDoYUWeFCebjzHHuT2HiA6pn1beZCZTNso7ecXLyR5iFZaxPfDQRtp8w9SAM4279wKF2
	TWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=S+AyZ0bAi304mc5VZCnGq7REC7xG1u9rMfS5iiQ4ETc=;
	b=Tqeog0HkSSSlv9fx92c2XG8mkZpdUeuNRjn25sz3epEZVT3x2rLvZb9fVRWvhnT8QT
	O4OU/s/307lHrhhV1zrEWhtCx+m/gQXEFUmhOjNyvXuTM/fGT/kMKyDdno1SQQrPqw4i
	LlO3XDlIFHgHX2+AAxfmXBYrUMeOlZNpw/zZVvsp+PZ0D5Vv5jDFjr8PtNsr7rHuwQkq
	3N6+qPy/f6PwZtyJ7D7q0imDgkY6Hm8DQuG66IP+JCtUwbr561YnVzi5hnbfjp4AZ7Jl
	FtvfQFBj1cWozc7H9JFJsujsZ3xwB9GCsHQ8Zb+p7M1nsduNd14I+O83fH6v8fCz3+GI
	JIjQ==
X-Gm-Message-State: AG10YOQmOgbg4tBuZHvcdYAh7JhXf6Y00yDgAvZMChVROFVsGor5h7rKNSt1AHAxInehgQ==
X-Received: by 10.98.67.67 with SMTP id q64mr38055732pfa.133.1454331151773;
	Mon, 01 Feb 2016 04:52:31 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	q136sm43127350pfq.66.2016.02.01.04.52.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 04:52:30 -0800 (PST)
Date: Mon, 1 Feb 2016 12:52:28 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20160201125228.GA18246@vultr.guest>
References: <1453644598-11250-1-git-send-email-richard.weiyang@gmail.com>
	<1453644598-11250-2-git-send-email-richard.weiyang@gmail.com>
	<56AC8692.3010403@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56AC8692.3010403@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::244
Cc: qemu-trivial@nongnu.org, amit.shah@redhat.com, quintela@redhat.com,
	qemu-devel <qemu-devel@nongnu.org>, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] qmp-spec: fix index in doc
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
X-List-Received-Date: Mon, 01 Feb 2016 12:52:38 -0000

On Sat, Jan 30, 2016 at 12:46:58PM +0300, Michael Tokarev wrote:
>24.01.2016 17:09, Wei Yang wrote:
>> The index is duplicated. Just change it.
>
>It is indeed, with previous being 2.5 as well
>and the next being 3. Applying to -trivial.
>
>Please the next time send to qemu-devel@ and Cc to -trivial.
>

Thanks, got the correct procedure.

>Thanks!
>
>/mjt
>
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  docs/qmp-spec.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/docs/qmp-spec.txt b/docs/qmp-spec.txt
>> index 4fb10a5..8e4bc3d 100644
>> --- a/docs/qmp-spec.txt
>> +++ b/docs/qmp-spec.txt
>> @@ -180,7 +180,7 @@ Some events are rate-limited to at most one per second.  If additional
>>  dropped, and the last one is delayed.  "Similar" normally means same
>>  event type.  See qmp-events.txt for details.
>>  
>> -2.5 QGA Synchronization
>> +2.6 QGA Synchronization
>>  -----------------------
>>  
>>  When using QGA, an additional synchronization feature is built into
>> 

-- 
Wei Yang
Help you, Help me

