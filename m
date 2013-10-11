Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUlaX-0000E4-NU
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 18:53:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VUjMQ-0002PX-BM
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:31:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1VUjML-0005e0-6L
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 16:30:58 -0400
Received: from omzsmtpe02.verizonbusiness.com ([199.249.25.209]:57968)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1VUjMA-0005ZQ-4W; Fri, 11 Oct 2013 16:30:42 -0400
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi01.verizon.com) ([166.68.71.143])
	by omzsmtpe02.verizonbusiness.com with ESMTP; 11 Oct 2013 20:30:34 +0000
X-IronPort-AV: E=Sophos;i="4.93,1082,1378857600"; d="scan'208";a="579740455"
Received: from unknown (HELO MIA20725CAS892.apps.tmrk.corp) ([162.47.0.51])
	by fldsmtpi01.verizon.com with ESMTP; 11 Oct 2013 20:30:33 +0000
Received: from yoyo.cloudswitch.com (10.25.25.113) by
	MIA20725CAS892.apps.tmrk.corp (10.1.3.224) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Fri, 11 Oct 2013 16:29:00 -0400
Message-ID: <52585F8B.6080604@cloudswitch.com>
Date: Fri, 11 Oct 2013 16:28:59 -0400
From: Don Koch <dkoch@cloudswitch.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1381520073-32674-1-git-send-email-sw@weilnetz.de>
	<52585983.1000606@terremark.com>
	<CAFEAcA8QMiNuBMN0=DmXA8RqV9iVdoD-weGF04njKCGw1nbbyg@mail.gmail.com>
In-Reply-To: <CAFEAcA8QMiNuBMN0=DmXA8RqV9iVdoD-weGF04njKCGw1nbbyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.209
X-Mailman-Approved-At: Fri, 11 Oct 2013 18:53:39 -0400
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel <qemu-devel@nongnu.org>,
	Don Koch <dkoch@verizon.com>, Alexander Graf <agraf@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] misc: Spelling and
	grammar fixes in comments
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
X-List-Received-Date: Fri, 11 Oct 2013 20:31:03 -0000

On 10/11/2013 04:10 PM, Peter Maydell wrote:
> On 12 October 2013 05:03, Don Koch <dkoch@verizon.com> wrote:
>> On 10/11/2013 03:34 PM, Stefan Weil wrote:
>>> * it's -> its
>>> * grammar fix in ui/vnc-enc-zywrle.h
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>
>>> This is v3 of http://patchwork.ozlabs.org/patch/257416/.
>>>
>>> v3:
>>> Don't try to improve a strange sentence in the same context ("Of cause [...]").
> 
>>>   In this method, H/L and X0/X1 is always same position.
>>> - This lead us to more speed and less memory.
>>> + This leads us to more speed and less memory.
>>>   Of cause, the result of both method is quite same
>>>   because it's only difference that coefficient position.
>>>  */
>>>
>>
>> Since you're in the neighborhood, this paragraph needs more fixes:
> 
> No, see the note above and the previous discussion.

In that case, there in no point in fixing just the lead/leads typo.

>>  In this method, H/L and X0/X1 is always in the same position.
>>  This leads us to more speed and less memory.
>>  Of course, the result of both methods is the same
>>  because the only difference is the coefficient position.
> 
> Unless you want to say you've reviewed the code and
> are completely confident that the original author meant
> "the same" or "exactly the same" and not "quite similar"
> then we need to leave the original wording alone.
> 
> -- PMM
> 

-d



