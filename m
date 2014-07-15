Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X6yHY-0006FD-DJ
	for mharc-qemu-trivial@gnu.org; Tue, 15 Jul 2014 04:40:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X6yHQ-0006CW-Ov
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 04:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1X6yHK-0005XO-Ly
	for qemu-trivial@nongnu.org; Tue, 15 Jul 2014 04:40:08 -0400
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:61795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1X6yHK-0005WX-EH; Tue, 15 Jul 2014 04:40:02 -0400
Received: by mail-qg0-f41.google.com with SMTP id q107so2351549qgd.28
	for <multiple recipients>; Tue, 15 Jul 2014 01:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=thAXlejMjuzq1xkPC/DVqOofymYYLpVvOG27ijtl3IQ=;
	b=OOTVibmy7+Dk11ykk+QrNy3b068jcuncZiMtKUyuIiK/VBTsTZFjISd8QONDIRJ1T+
	ozlMQh3D7a49xlm7+gA8CtNj08pi4JU7F/pkJFfTbyEcHOaJ1qmLYtyhMIb95oyPl7pN
	RPTYhd0FEqyd/91aDmOTfviMw2M/urUBgUJ2kafmKAjeA8JdYLRkWxYVwoljhg/H4uob
	nC19nNStmHOMWO1TMCiH3bmxIFc9k0rfZ6ArQThmuigbdHeYGErPsPE9oe63vSjy8V1D
	rJnIMV8xccaS58QYAjQp+3W2F7hLnqC2YcvhXDbiSg9hHQAuyR8ru3ECz+mRAU1RbpuT
	ddmg==
X-Received: by 10.224.57.148 with SMTP id c20mr30505145qah.31.1405413601902;
	Tue, 15 Jul 2014 01:40:01 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-116-204-163.cust.vodafonedsl.it. [37.116.204.163])
	by mx.google.com with ESMTPSA id l76sm11509893qga.8.2014.07.15.01.39.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 01:40:00 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53C4E8DB.1040502@redhat.com>
Date: Tue, 15 Jul 2014 10:39:55 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>	<877g442kie.fsf@blackfin.pond.sub.org>	<CAEgOgz77aLSt_vww3LwhT5-kUaJhDnmgdDVVdBfQXQvm-DzSUg@mail.gmail.com>	<87fvi46jyc.fsf@blackfin.pond.sub.org>
	<1405413340.23139.7.camel@nilsson.home.kraxel.org>
In-Reply-To: <1405413340.23139.7.camel@nilsson.home.kraxel.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::229
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] serial-pci: remove memory regions from
 BAR before destroying them
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
X-List-Received-Date: Tue, 15 Jul 2014 08:40:14 -0000

Il 15/07/2014 10:35, Gerd Hoffmann ha scritto:
> On Mo, 2014-07-14 at 17:25 +0200, Markus Armbruster wrote:
>> Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:
>>
>>> On Thu, Jun 26, 2014 at 5:32 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>>
>>>>> Otherwise, hot-unplug of pci-serial-2x trips the assertion
>>>>> in memory_region_destroy:
>>>>>
>>>>>     (qemu) device_del gg
>>>>>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021:
>>>>> memory_region_destroy: Assertion `((&mr->subregions)->tqh_first ==
>>>>> ((void *)0))' failed.
>>>>>     Aborted (core dumped)
>>>>>
>>>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>>
>>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>>
>>>
>>> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> Nominating for 2.1, just to be explicit.
>>
>> [...]
>
> Hmm, is trivial out of service?  I remember thinking "Ok, trivial patch,
> qemu-trivial is cc'ed, that'll pick it up, nothing to do for me."

I think it's more likely that Michael went on vacation, from a quick 
look at his posting history.

Paolo


