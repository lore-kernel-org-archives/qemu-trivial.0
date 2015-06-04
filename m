Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0rqL-00065e-4a
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jun 2015 09:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>) id 1Z0ZDN-0006rD-Mk
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 13:46:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>) id 1Z0ZDM-0000AC-1H
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 13:46:01 -0400
Received: from mail-qc0-x235.google.com ([2607:f8b0:400d:c01::235]:36598)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <don.slutz@gmail.com>)
	id 1Z0ZDH-00007m-GB; Thu, 04 Jun 2015 13:45:55 -0400
Received: by qcxw10 with SMTP id w10so20748209qcx.3;
	Thu, 04 Jun 2015 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:date:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=j+Dv9kDIERvQhec4T+iTj3VVRJzDw2yKQH4V+EJqmo0=;
	b=uKh6rnHSOB+8O/JcxXdLEcyqit5m1BLPGqOYBg16Bmm4tJbRekGr4jihHP3SVkb8Gf
	oNnWzfrexbNpx5iwIRkjSLwrC/c+xGriVM3c7qMuGZ4WKhjkigdzaefwByb6Efytentl
	4Lhiuhm0K46DmlFdVijWzl4QFzURsRq9Lb/6WPZWmHhT5Urce/Maob/v0/E0oGbNGpCd
	U8vNGHF7q98jCjbhOsW7BjeV/llB87Iwbwhj21ze0HxIHlqxb0ZVkmtT9Lm5g8u/r6F+
	SPbNq/KxfCVsIP0azX/j3ZWmg4f/NFx/eXIX7NUsZJd8OPoeGQZbDwYRx7GWUFasp7zh
	SJsw==
X-Received: by 10.140.238.8 with SMTP id j8mr46266401qhc.78.1433439954143;
	Thu, 04 Jun 2015 10:45:54 -0700 (PDT)
Received: from don-760.CloudSwitch.com ([65.209.111.106])
	by mx.google.com with ESMTPSA id f90sm2737819qgf.2.2015.06.04.10.45.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 10:45:52 -0700 (PDT)
From: Don Slutz <don.slutz@gmail.com>
X-Google-Original-From: Don Slutz <Don.Slutz@Gmail.com>
Message-ID: <55708ECF.5070005@Gmail.com>
Date: Thu, 04 Jun 2015 13:45:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Daniel P. Berrange" <berrange@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>
References: <1433258768-28946-1-git-send-email-berrange@redhat.com>	<87twupxmgj.fsf@blackfin.pond.sub.org>
	<20150604133034.GB27201@redhat.com>
In-Reply-To: <20150604133034.GB27201@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::235
X-Mailman-Approved-At: Fri, 05 Jun 2015 09:39:26 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add .dir-locals.el file to
 configure emacs coding style
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
X-List-Received-Date: Thu, 04 Jun 2015 17:46:03 -0000

On 06/04/15 09:30, Daniel P. Berrange wrote:
> On Wed, Jun 03, 2015 at 09:47:24AM +0200, Markus Armbruster wrote:
>> "Daniel P. Berrange" <berrange@redhat.com> writes:
>>
>>> The default emacs setup indents by 2 spaces and uses tabs
>>> which is counter to the QEMU coding style rules. Adding a
>>> .dir-locals.el file in the top level of the GIT repo will
>>> inform emacs about the QEMU coding style, and so assist
>>> contributors in avoiding common style mistakes before
>>> they submit patches.
>>
>> Yes, please!
>>
>>> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
>>> ---
>>>  .dir-locals.el | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>  create mode 100644 .dir-locals.el
>>>
>>> diff --git a/.dir-locals.el b/.dir-locals.el
>>> new file mode 100644
>>> index 0000000..ddb2fae
>>> --- /dev/null
>>> +++ b/.dir-locals.el
>>> @@ -0,0 +1,8 @@
>>> +(
>>> + (c-mode . (
>>> +            (c-file-style . "K&R")
>>> +            (indent-tabs-mode . nil)
>>> +            (c-indent-level . 4)
>>> +            (c-basic-offset . 4)
>>> +            ))
>>> +)
> 
> [snip]
> 
>> Does the following .dir-locals.el work for you equally well?
>>
>> ((c-mode . ((c-file-style . "stroustrup")
>>             (indent-tabs-mode . nil))))
> 
> Yes, that is fine too.
> 

I got this from someone on the list, see

https://wiki.linaro.org/PeterMaydell/QemuEmacsStyle

Which then allows me to do:

((c-mode . ((c-file-style . "qemu"))))

in .dir-locals.el

But this is not a good general change :(

But I would like at least the the stroustrup version.

   -Don Slutz

> Regards,
> Daniel
> 

