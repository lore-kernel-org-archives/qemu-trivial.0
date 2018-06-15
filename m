Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTer6-00077s-9X
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jun 2018 22:52:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTer2-00077U-DB
	for qemu-trivial@nongnu.org; Thu, 14 Jun 2018 22:52:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTeqz-0000oc-9G
	for qemu-trivial@nongnu.org; Thu, 14 Jun 2018 22:52:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:46044)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTeqz-0000n4-3a; Thu, 14 Jun 2018 22:52:45 -0400
Received: by mail-qt0-x242.google.com with SMTP id i18-v6so7831411qtp.12;
	Thu, 14 Jun 2018 19:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=U/pV9igBF3VWrV8QhTDAWOTlQFeuWtYf1xlqyn4akW8=;
	b=VX+wx4iguzsjhqY/Oczu2pWTO4SX4ePcdvHdGoChtF5uYGSFDPtXCF8bwFoqfEyTk/
	qMEO2pWEnWiRdHlAybMdY7b+VBaW+jQkh2vAtG+LMUI0ybmjZ6AsTJTGESCI7yzUhIJ6
	Pn2Y6NIO8DISQ69PnjNTcReZ1OnRHeDyxzlnD9I98Anlo/waqpzuNHdGg7jlTqH8EGvM
	o+TarWNw+HVWkV8MybIyr6uOnRQSR5xMjg2drmnJPvIK19UvIDTUrtIPyEEpuaULPAVe
	gW6+SCGyTtDF0MCpqQ6T8olcmx4+kVtTrrinvy12TUO9GtI1jLK2R1vMXSjft0l1UMHY
	BqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=U/pV9igBF3VWrV8QhTDAWOTlQFeuWtYf1xlqyn4akW8=;
	b=A60kvmZvFOa+lzEkvg4t8cG5z1KWQ1f1XJxiJbXpIsYL5rgQv+joQsREuKufeixY1k
	LGFxl2wn1SbFO7ozpvNe4+iANzNA4PR3ltWwdgOi3BA2eyd0cPXxA/jWGavdRPJOZ6JA
	G6TgO7184K7gXJVoLGaaFWsGzfUyOlzv2tnn8Et+WVmV7eiEel79kAWte7KnLyri7DE9
	508+wtpHk+EfaWLfsy/PuJ2BRf0GDw35gLyN9n/3gGNuHx9+zYJV6tK8+6oMW2vQLmjz
	c5O7eNXb/stdDJh2rg1/ViO133LYxVooV36dDQAjEBgjqH++qA/fBt4UJk4Rd7H+t7yr
	3FOg==
X-Gm-Message-State: APt69E3vOSmcRRdoyhAahOwR8CUaG3l9wiK2dQacHSWZcSQYCObjjuSj
	8ftVRkxN5QQl12dCbNdFabc=
X-Google-Smtp-Source: ADUXVKLkljvKsZz4BX4O/RDC82TySkq6q8kPZWPqWiMQgmLRyfkr2RM5ZW5uEXIoXzlgCsdlws4JWg==
X-Received: by 2002:ac8:19ab:: with SMTP id
	u40-v6mr4843830qtj.266.1529031164408; 
	Thu, 14 Jun 2018 19:52:44 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	p72-v6sm5520886qki.15.2018.06.14.19.52.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 19:52:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: John Snow <jsnow@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, "patches@linaro.org" <patches@linaro.org>, 
	Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<650048df-f4b1-b351-f877-be8c84197ba2@linaro.org>
	<CAFEAcA-vZH0KUxi+iYP3eYzXeHxNTotNwCMhEPcGhOLksbG71A@mail.gmail.com>
	<f9beda14-7c4a-8f89-baf1-5a79e847c4ac@redhat.com>
	<CAFEAcA_egToeW7ksTncbFCsW6uTh1FcPSgW6gx+VnjvQpqwWsw@mail.gmail.com>
	<ba6b4e80-c31a-6033-ea59-b4c4f1923be7@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8e29cd6e-6c54-30a2-a397-dbbacf343f0c@amsat.org>
Date: Thu, 14 Jun 2018 23:52:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <ba6b4e80-c31a-6033-ea59-b4c4f1923be7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Fri, 15 Jun 2018 02:52:50 -0000

On 06/14/2018 05:11 PM, John Snow wrote:
> On 06/14/2018 06:46 AM, Peter Maydell wrote:
>> On 13 June 2018 at 17:55, John Snow <jsnow@redhat.com> wrote:
>>> The same reasoning could be used to justify
>>>
>>> /* two
>>>  * lines */
>>>
>>> as it's ... actually just two lines. I think people don't seem to like
>>> this much either (why? does it look 'naked' on the end?)
>>
>> I dislike the way it breaks up the line of stars. For me it is the
>> /*
>>  *
>>  */
>> shape that defines a multiline comment, and where exactly the text is
>> on the RHS of it is not important to my sense of visual neatness :-)
>>
> 
> Yours does look an awful lot more symmetrical once you remove the text,
> yeah.
> 
> *cough* I hate the way it looks too, but C99 comments have a few things
> going for them:
> 
> // A multi-line comment block like this has no extra lines and every
> // line in the comment is prefaced individually which aids grep
> // readability, while maintained good vertical symmetry.
> 
> I think we hate C99 comments, though? Certainly we don't use them at all
> right now, so it's not a good fit.
> 
>>> It would only begin to matter terribly much if we actually decided we
>>> wanted to do a doxygen-style doc generation for our internal APIs for
>>> compatibility with, say, fancier IDEs than vim/emacs.
>>
>> We ought to do that at some point -- I had some prototype patches
>> for it. Doc-comment comments always start /** on a line of its own,
>> though.
>>
> 
> I'd love this! I love vim/emacs, but my usage of it is not wizard-tier
> and in the past when working on large C++ projects I have benefited from
> the magical refactoring click-buttons, tool-tips and etc. These
> operations are infrequent enough that I believe it's reasonable to not
> know how to do them in traditional CLI editors. If we want to lure in
> new contributors, maybe this could sweeten the pot a bit?
> 
> Rigorous, mechanically verifiable function documentation is quite nice
> to have in these cases. It'd be nice in general, really. It would go a
> long way to help us attract less "hardcore" developers implementing
> devices and features for QEMU without such a steep onboarding curve.
> 
> Do you have a proposed standard / do we have some consensus on which
> generator tool or doc format we'd most like to see in QEMU? I could put
> in some elbow grease to shine up the block layer if so...
> 
>>> As it stands, we're pretty inconsistent about which exact style we apply
>>> when we "document" internal functions -- sometimes we document the
>>> header, sometimes the implementation, sometimes both (but differently!)
>>> and always with different styles all over the place. That's the real
>>> problem, IMO.
>>
>> IMHO -- global functions should always be documented in the header
>> with the prototype, and any new global function should get a
>> doc comment (I require this for code I review...) I should be able
>> to read about the API your code exposes to the rest of QEMU purely
>> by looking at your headers.
>>
> 
> This makes sense, though the way C code is laid out makes it unfortunate
> you don't get to see the same comment right beside the implementation if
> that's what you're working on -- but I suppose this is why we have tabs,
> multi-monitors and IDEs with tooltips.

Thanks to tabs we don't need multi-monitors of 1600+ resolution to fit
80 chars per line.

