Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8JmQ-0003CG-0y
	for mharc-qemu-trivial@gnu.org; Sun, 02 Sep 2012 19:40:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>) id 1T8JmN-00034x-Ky
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 19:40:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>) id 1T8JmM-0002cF-Me
	for qemu-trivial@nongnu.org; Sun, 02 Sep 2012 19:40:35 -0400
Received: from mail-vc0-f173.google.com ([209.85.220.173]:41694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>)
	id 1T8JmJ-0002bG-W5; Sun, 02 Sep 2012 19:40:32 -0400
Received: by vcbgb23 with SMTP id gb23so4706168vcb.4
	for <multiple recipients>; Sun, 02 Sep 2012 16:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ktO1RULIgYAzhYEPMuPQC1hHorjtgUWf8gOgEV2H42o=;
	b=qlVQuQ3Q3LyTYH2Y5s3dhomOiz5IhW+92Cf/zwmrKfRp0wH+LSQy+S7rGufwawwJ6e
	jyYbHWTimm0/z6AoJzhgxc65CQq6E4i1SZh7B/ocAiFq0t0GkZ6unc/E6XV/oOtpEnwL
	bq3yZnYzEGZ6H0PsVvPfwD1+eeN0Jamx8Vvfw2sKNRBuBYCXRmyVP9Eww9/JNgnM88wl
	yIkjZtkkKZbEQIBcHRQ+V85dc2u+Jt9oyDhKb71tGHQw4uE1U4nD57gE4gzjvm/Bnb5y
	iMRjYQMnilsKFGryVf0hXJObfuKEyNtYWhEmoqtAJZ0EVF06Dd21WyG4Rk0YcYZrARAt
	Sbog==
Received: by 10.220.248.69 with SMTP id mf5mr10717063vcb.42.1346629230733;
	Sun, 02 Sep 2012 16:40:30 -0700 (PDT)
Received: from dslutz-lt.cloudswitch.com
	(pool-72-74-68-135.bstnma.fios.verizon.net. [72.74.68.135])
	by mx.google.com with ESMTPS id v9sm3916084ves.8.2012.09.02.16.40.28
	(version=SSLv3 cipher=OTHER); Sun, 02 Sep 2012 16:40:29 -0700 (PDT)
Message-ID: <5043EE6B.70509@CloudSwitch.com>
Date: Sun, 02 Sep 2012 19:40:27 -0400
From: Don Slutz <don.slutz@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090825)
MIME-Version: 1.0
To: Blue Swirl <blauwirbel@gmail.com>
References: <1346532470-15859-1-git-send-email-Don@CloudSwitch.com>
	<CAAu8pHsbxJrO+rRG8Hs8V9y65gm1RHJ0+UGWjxLapZatvVw5AA@mail.gmail.com>
In-Reply-To: <CAAu8pHsbxJrO+rRG8Hs8V9y65gm1RHJ0+UGWjxLapZatvVw5AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.220.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-i386: Report on
	error during cpu_x86_register().
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Don@CloudSwitch.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Sep 2012 23:40:36 -0000

Blue Swirl wrote:
> On Sat, Sep 1, 2012 at 8:47 PM, Don Slutz <Don@cloudswitch.com> wrote:
>   
>> Send it to stderr before free of the details.
>>
>> Signed-off-by: Don Slutz <Don@CloudSwitch.com>
>> ---
>>  target-i386/cpu.c |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
>> index 57c064f..5c0fef1 100644
>> --- a/target-i386/cpu.c
>> +++ b/target-i386/cpu.c
>> @@ -1352,6 +1352,7 @@ int cpu_x86_register(X86CPU *cpu, const char *cpu_model)
>>      }
>>      object_property_set_str(OBJECT(cpu), def->model_id, "model-id", &error);
>>      if (error_is_set(&error)) {
>> +        fprintf(stderr, "%s: %s\n", __FUNCTION__, error_get_pretty(error));
>>     
>
> __func__ is preferred by checkpatch.pl and also GCC recommends using it:
> http://gcc.gnu.org/onlinedocs/gcc/Function-Names.html
>
>   
>>          error_free(error);
>>          return -1;
>>      }
>> --
>> 1.7.1
>>
>>
>>     
Somehow I forgot to run checkpatch.pl on this.  V2 soon.
   -Don

