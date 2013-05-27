Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh6OK-0000Nh-49
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 18:59:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh6OG-0000MD-AB
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 18:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh6OE-0004IN-2X
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 18:59:44 -0400
Received: from mail-pa0-f51.google.com ([209.85.220.51]:60140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Uh6OD-0004I9-Sj
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 18:59:41 -0400
Received: by mail-pa0-f51.google.com with SMTP id lf10so6226439pab.38
	for <qemu-trivial@nongnu.org>; Mon, 27 May 2013 15:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=tSvKCnyA2K3WTK+EaZkz2vNRrQhID/R892gO7zhemmk=;
	b=BvOHRipYHa30lAcudhFLhDj4mfFQNN8ZXkvdM+BlvJSZPtAS2f401ngFDyaTqxqKjV
	AKMbotc9af/JFDvEZnhs/3UTmG6LyRIndCc/uyYQ3M5QoqcjI9ef2WCcGnY8Wr9JPcq5
	//joqqz/dTVXoeIl7ElgaDKiu+MMQfEzO+Oqnb9gK1uzi6YHP0S0x+8H/I9WL/l27Gj+
	TwN1NMqtGMNwp4jV66dkPPlNACl6OxO0+Hb5kdD0mfWKpjNGlOAtPWRiZiHQi9rTzLRj
	7brVU72faJhys+F+S4o1R9I7QP2I4rd7cd38Gm2PnAO9vUeylSbqwTyUwx0oFXRZMfsE
	O7yw==
X-Received: by 10.68.201.5 with SMTP id jw5mr31257749pbc.40.1369695580715;
	Mon, 27 May 2013 15:59:40 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id pl9sm11857786pbc.5.2013.05.27.15.59.36
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 27 May 2013 15:59:39 -0700 (PDT)
Message-ID: <51A3E556.3020509@ozlabs.ru>
Date: Tue, 28 May 2013 08:59:34 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <51A36976.80608@ozlabs.ru>
	<1369663979-25613-1-git-send-email-aik@ozlabs.ru>
	<51A37568.1060705@redhat.com>
In-Reply-To: <51A37568.1060705@redhat.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQkv9+VuWsH7GBh2wgh94nGT/svSyxwXmskiDW0y3ZSr0RH8DOB4D5QGlNkwbEAL9V33ejzY
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.51
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 22:59:47 -0000

On 05/28/2013 01:02 AM, Paolo Bonzini wrote:
> Il 27/05/2013 16:12, Alexey Kardashevskiy ha scritto:
>> The symlink to platform linux headers is made in the build tree by
>> the configure script but gcc is not told to look for them there.
>> The patch fixes this.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>  configure |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 5ae7e4a..5ba691a 100755
>> --- a/configure
>> +++ b/configure
>> @@ -547,7 +547,7 @@ Haiku)
>>    if [ "$cpu" = "i386" -o "$cpu" = "x86_64" ] ; then
>>      audio_possible_drivers="$audio_possible_drivers fmod"
>>    fi
>> -  QEMU_INCLUDES="-I\$(SRC_PATH)/linux-headers $QEMU_INCLUDES"
>> +  QEMU_INCLUDES="-I$(pwd)/linux-headers $QEMU_INCLUDES"
> 
> You need to have both directories.  Files other than asm/*.h will be
> found in the source path.

So do I need this?

+  QEMU_INCLUDES="-I$(pwd)/linux-headers -I\$(SRC_PATH)/linux-headers
$QEMU_INCLUDES"




-- 
Alexey

