Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSmA5-0002hf-Qh
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 06:01:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSm9w-0002VT-W9
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 06:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSm9p-0008VP-EH
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 06:01:28 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:40670)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TSm9p-0008VD-9z
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 06:01:21 -0400
Received: by mail-ie0-f173.google.com with SMTP id 17so6549933iea.4
	for <qemu-trivial@nongnu.org>; Mon, 29 Oct 2012 03:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=5Pu8XjDwO040rY2ZZ3lCq5oQ1JQ8LFxBXTqWKEBbUKY=;
	b=WbIWNr1VNmdnGw+cJIgxvm2LlESkIX4MI8lN0VN8nQ2IYVjOIUuZcnDrcfgeCMlvor
	l1objAVnlNUTJYZ+EJX14BD2JNTkX8TXIYqMa2Sj2CZOY3W50JsoY7tzWNwmPkRoeiDZ
	U3re1OlVoGgmZuvAj+6yn+nnfLsKUg4PVejeCRgZ73S+e5TYFPNusDMd/Tre7fbLtn5m
	fFp5LUfhKw8xTphUm+q95p++qz3inykKmGxq3L5tt8POmY32BsnnJkgyWQrKIQ02WiGZ
	Oe2WSxfdamWbtK4NuP6rj2FSNkO73I1jJNhTfg1rr9hwFmYbqKCt1qXNded4ZmYy7cDr
	+n0A==
MIME-Version: 1.0
Received: by 10.50.161.169 with SMTP id xt9mr8725350igb.62.1351504880593; Mon,
	29 Oct 2012 03:01:20 -0700 (PDT)
Received: by 10.50.87.105 with HTTP; Mon, 29 Oct 2012 03:01:20 -0700 (PDT)
In-Reply-To: <20121029095440.GB30593@stefanha-thinkpad.redhat.com>
References: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
	<20121029095440.GB30593@stefanha-thinkpad.redhat.com>
Date: Mon, 29 Oct 2012 10:01:20 +0000
Message-ID: <CAFEAcA9xQms-YE3v8BNWA8kNrfeJmtgwtbFJ=5J3nF+UzsDtPA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn9GqqBPtXOSg8ea0qauWw6hKAp1OcRzTg1OOnplnbMMpQn2xBoVhVMk0rjFFy3j73hxUsQ
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove stray debug output
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
X-List-Received-Date: Mon, 29 Oct 2012 10:01:35 -0000

On 29 October 2012 09:54, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Sat, Oct 20, 2012 at 08:37:04PM +0100, Peter Maydell wrote:
>> Rather than printing a message saying we're silently falling
>> back to gthread coroutines when running on MacOS, actually
>> do it silently.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I guess this is a self-falsifying echo :-)
>>
>>  configure | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 9f33c7d..e07baf3 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2900,8 +2900,6 @@ EOF
>>      else
>>       coroutine_backend=gthread
>>      fi
>> -  else
>> -    echo "Silently falling back into gthread backend under darwin"
>>    fi
>
> Is there a reason to remove the echo?

1. Nothing else in configure prints progress messages during the
   testing phase
2. The echo is by definition printing something that's false
3. We print the chosen coroutine backend at the end as part of
   the standard "what did configure do?" output block, so removing
   this echo loses no information

-- PMM

