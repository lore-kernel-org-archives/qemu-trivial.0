Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCOc-0006AV-N8
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:26:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XoCOV-00060Q-W3
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:26:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1XoCOR-0000MC-BC
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:26:07 -0500
Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a]:57457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1XoCOF-0000AS-4x; Tue, 11 Nov 2014 09:25:51 -0500
Received: by mail-pa0-f42.google.com with SMTP id bj1so10787136pad.29
	for <multiple recipients>; Tue, 11 Nov 2014 06:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=bvXgjcy7m75LrutWhJo+/jpqPQzOYRyEhiptdFPpIes=;
	b=k8WhlLYO+aERigtXkr8cyRrfuwJYx7vPuEXtqllfpEggl+R2jg9nC7fjOzy2+RGN6o
	FAcOX4OBdKdGEjsLhZHb7H23zYsMv00C691ZDx6Jx5FyfPpDRI08ZxrbLH9vr7A1ec31
	K2zXbGvw8MpduKjVSPm6HXuJcoq3Z+RQ7ttp5URgrGKhKhclG1n8MnZDhWsN7XQM9WPU
	KZau0TUV8ZgGswFjqVXhOpbznrRxv3elwfbfbq5tRj8pHBL7SXP3RjWmdgmbn6ddbpWZ
	XvUYp4PdwYbpLIdW9jNfUabUzaBJ4QMad1kihJ7Tb0SX/eYt6gx8/b/y7CkDsDqif4xi
	dvAA==
X-Received: by 10.68.241.10 with SMTP id we10mr39818095pbc.101.1415715950111; 
	Tue, 11 Nov 2014 06:25:50 -0800 (PST)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([223.72.65.118])
	by mx.google.com with ESMTPSA id o6sm19587604pdl.3.2014.11.11.06.25.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 06:25:49 -0800 (PST)
Message-ID: <54621DE6.60108@gmail.com>
Date: Tue, 11 Nov 2014 22:32:06 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <5461D59C.5020106@gmail.com>
	<alpine.DEB.2.02.1411111052280.26318@kaball.uk.xensource.com>
	<20141111142359.GB8751@konrad-lan.dumpdata.com>
In-Reply-To: <20141111142359.GB8751@konrad-lan.dumpdata.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22a
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Xen-devel] [PATCH trivial] xen-hvm: Remove
 redandant varialbe 'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 14:26:12 -0000


On 11/11/14 22:24, Konrad Rzeszutek Wilk wrote:
> On Tue, Nov 11, 2014 at 10:53:01AM +0000, Stefano Stabellini wrote:
>> On Tue, 11 Nov 2014, Chen Gang wrote:
>>> In xen_hvm_change_state_handler(), can pass 'opaque' with type cast to
>>> xen_main_loop_prepare() directly, need not use additional variable for
>>> it.
> 
> The title of your patch should say 'variable'.

Oh, yes, thanks. If necessary to send patch v2 for it, please let me
know.

Thanks.

>>>
>>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>>
>> Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>>
>>
>>>  xen-hvm.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/xen-hvm.c b/xen-hvm.c
>>> index 21f1cbb..7548794 100644
>>> --- a/xen-hvm.c
>>> +++ b/xen-hvm.c
>>> @@ -993,9 +993,8 @@ static void xen_main_loop_prepare(XenIOState *state)
>>>  static void xen_hvm_change_state_handler(void *opaque, int running,
>>>                                           RunState rstate)
>>>  {
>>> -    XenIOState *xstate = opaque;
>>>      if (running) {
>>> -        xen_main_loop_prepare(xstate);
>>> +        xen_main_loop_prepare((XenIOState *)opaque);
>>>      }
>>>  }
>>>  
>>> -- 
>>> 1.8.5.2 (Apple Git-48)
>>>
>>
>> _______________________________________________
>> Xen-devel mailing list
>> Xen-devel@lists.xen.org
>> http://lists.xen.org/xen-devel

-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

