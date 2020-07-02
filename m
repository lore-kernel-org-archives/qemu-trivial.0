Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqtuu-0003oI-0X
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 03:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jqtus-0003l4-7G
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 03:45:54 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42288
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jqtuq-0006Pf-Fi
 for qemu-trivial@nongnu.org; Thu, 02 Jul 2020 03:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593675950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqXIYaqrP69iIlxsLf6IOdoE/j+Dn+PhnFCdaO9hJC4=;
 b=F0ZS2+diSl4Ws7FoIjJp+Hv646ylEpLz7M9UA2VVmIjjqOKWtIsbTa6v+LmSQyoGTRL7Tm
 epX0VeBkDPt/W3JPNLEL5GO/YSUn8bCzM4lTmN6MYl3ZjNQOKXAYZ0dYE4QfLV8MVYe8uX
 GDMLxy8MHDxoRGUx+vTSGhzOKC6GIkI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-SFCOWpoRM3mUH8A5AWttbg-1; Thu, 02 Jul 2020 03:45:49 -0400
X-MC-Unique: SFCOWpoRM3mUH8A5AWttbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8E6019057A2;
 Thu,  2 Jul 2020 07:45:47 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-212.ams2.redhat.com [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1DB610F2;
 Thu,  2 Jul 2020 07:45:45 +0000 (UTC)
Subject: Re: [PATCH v3 0/5] hw/mips/malta: Add the 'malta-strict' machine,
 matching Malta hardware
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-trivial@nongnu.org,
 Yunqiang Su <ysu@wavecomp.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200630195723.1359-1-f4bug@amsat.org>
 <CAHiYmc6d3Q2A237qVqp6s0MagXqgy11aX9r_LuJsGkoJxRhfQw@mail.gmail.com>
 <20200701173944.GA1090525@aurel32.net>
 <CAHiYmc5Y6_OcjYS8zR=hKGFeeL9zJ2g+CX8jeNyZdyMnH6uO+g@mail.gmail.com>
 <20200701211703.GB1093119@aurel32.net>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ddc3ff7e-1582-2e76-2dbb-c60085d41711@redhat.com>
Date: Thu, 2 Jul 2020 09:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200701211703.GB1093119@aurel32.net>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:42:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jul 2020 07:45:54 -0000

On 01/07/2020 23.17, Aurelien Jarno wrote:
> Aleksandar,
> 
> On 2020-07-01 20:51, Aleksandar Markovic wrote:
>> On Wed, Jul 1, 2020 at 7:39 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>>>
>>> Aleksandar,
>>>
>>> On 2020-06-30 23:54, Aleksandar Markovic wrote:
>>>> As, in a very clear way, evidenced from the previous versions of this
>>>> series, this series real goal was not not to create some new
>>>> "malta-strict" machine, but to prepare path to creation of some
>>>> imagined "malta-unleashed" machine which will, to the contrary of
>>>> proclaimed goal, create a machine that could never exist in reality.
>>>> That is why I can't accept this series.
>>>
>>> I do not understand your opposition to this, and why it is an issue to
>>> support more than 2GiB of RAM for such a board. Supporting more than 2GiB
>>> of memory doesn't prevent people to emulate a real Malta board with less
>>> memory.
>>>
>>> In addition to that, the Malta board in QEMU has been supporting for
>>> many years more than the maximum 256MiB that is possible on a physical
>>> board. The QEMU version also supports way more than CPU variants than
>>> the physical board. In other word the existing malta machine in QEMU is
>>> already a "malta-unleashed".
>>>
>>
>> Aurelien,
>>
>> Glad to see you again. I am really sorry you were absent for so long.
> 
> I assumed that since haven't dramatically changes in QEMU since I left,
> however if I missed some recent discussions that goes again what I am
> saying below, please feel free to point me to them.
> 
>> Those (what you described in the paragraphs above) were mistakes from
>> the past. At some point, we needed to stop doing it, and finally
>> returned to the root QEMU principles of emulating systems as
>> faithfully as possible.
> 
> I think there is a big misunderstanding here. The root QEMU principle is
> to emulate each *device* or *feature* as faithfully as possible. The
> *default* system that is emulated should also match as much as possible
> the real hardware, but QEMU also gives users the possibility to create a
> system as they want. And the amount of memory is one them.  That's
> actually all the beauty of QEMU. Remember that QEMU solely exists
> because it has users, and that the possibility to extend the RAM of the
> Malta board to 2GB and to select various CPUs is widely used by users.
> 
> So overall there are plenty of counter examples to your "root QEMU
> principles". Daniel P. Berrangé mentioned the memory support on the
> i440fx x86 hardware. As other examples you can also add AMD 3D Now
> instructions to an Intel CPU, or add an AC97 sound device to a SH4
> machine. Virtio is another example.

I fully agree with Aurelien and Daniel here. As far as I know, there has 
never been a "root QEMU principle" that says that we have to restrict 
things like RAM sizes to the constraints of real hardware.

Aleksandar, where did you get the idea of that "root QEMU principle" 
from? If it's something that is written in our documentation somewhere, 
it's maybe misleading and needs to be rewritten, so please provide a 
pointer.

  Thanks,
   Thomas


