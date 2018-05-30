Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNrY7-0002xd-2h
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 23:13:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrY1-0002tc-ME
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 23:13:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrY0-0003DG-Pg
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 23:13:13 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNrXr-00036X-FB; Tue, 29 May 2018 23:13:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id q6-v6so21498008qtn.3;
	Tue, 29 May 2018 20:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZzG4pd4M3r2HyHqGe2XgYXNSMX0zwMC9KFhl6J/Lqlo=;
	b=ng9+HV4r9j1a1+P2QfB6gdFgVhVQxJYi8EhArsDz8vtYf9bVENXlWj40O2J8FA21of
	1xZSZzt5XG5KM/AjuZlcDGpCYGMvsEGmyAQw2z7KoNtXbyiaTUJQJTQzlC2qH82L9aBs
	n0jsZ2pVkQ8DOBqFheUbAZ2YET1WIR8DPaRMU4BUcmdGpbmiUn+MqWiSCftPM8e1Lqng
	wY6zViZcIjynPIocSDwTFbnBnImNUsA6ZFQouyqkoA8ptHOinhWZhQ2n1t6fRUO59sHz
	92UKSrsCWAdpHYW7TEb3Zj3iNCXBRxdN0Nnh/mnF+C+2yDjAO8XRfQyquLKWPhk65eRI
	slHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZzG4pd4M3r2HyHqGe2XgYXNSMX0zwMC9KFhl6J/Lqlo=;
	b=odN9pwMII9G5p2/h3Tn8Av+xV/w+qJ2QDYzFos01sf3Tq2o7vmDe9YmTuBXGIpqCWM
	wMgNeuFWpnc4N0M8NBiujS4n0RFoDQW2J497ZuT12lpf2cB5MTZouo6UzNXC5H7vwzJ9
	ggXY1nS4RD4KuldPiUFj5wv+c2ffcDyPhMjIGDESFd3di6+VAIpg5lyqB16CFpl76Kbc
	Lo1RWC832JT4ulObNIIx/38xmkpSKl1VFrmUX36ENxjv2Al5pclGpNCen8maSOLXaxf0
	7tvBeubaKXjyEiAmFselDaf2gqKQtwls4DtE8noB4gn3B+sFfRHLFTIIOjP3+VfaOvIJ
	nSQA==
X-Gm-Message-State: APt69E2LQSRBlQYP60LVaDiNDSzSnZFSNWZ0/Ssx6DZq+DyZfAF44TBg
	ouysTSvYfDI7UA/LXgtx/9Szdclu
X-Google-Smtp-Source: ADUXVKK+3rAJz1c20tdPp4wnxpjCaryImWaOaqFMoBmzp75MO1+QuYK+vpyT0mDqqsZ5ZZyVRjGVzw==
X-Received: by 2002:ac8:3cf:: with SMTP id z15-v6mr945470qtg.119.1527649982642;
	Tue, 29 May 2018 20:13:02 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f22-v6sm23587815qke.94.2018.05.29.20.12.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 20:13:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
	Anthony Green <green@moxielogic.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>, 
	David Hildenbrand <david@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	"open list:S390" <qemu-s390x@nongnu.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
Date: Wed, 30 May 2018 00:12:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180529134053.1ea9f46d.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
X-List-Received-Date: Wed, 30 May 2018 03:13:17 -0000

Hi Cornelia,

On 05/29/2018 08:40 AM, Cornelia Huck wrote:
> On Mon, 28 May 2018 20:27:07 -0300
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> Code change produced with:
>>     $ git grep '#include "exec/exec-all.h"' | \
>>       cut -d: -f-1 | \
>>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|singlestep|TranslationBlock)" | \
> 
> Hm, does this expression catch all files that need to include
> exec-all.h? The resulting patch seems fine, though.

No, not all :/
I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
more errors appear. In 2 more steps I added "cpu_address_space_init|"
then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for my
goal than trying to build a regex to explode function/struct names from
headers. This is a clever way to do it for long term command reuse taken
from commit messages...

>>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

