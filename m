Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAOTj-00043i-KF
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 12:33:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAOTc-0003ko-9O
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 12:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAOTV-0004c2-Cj
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 12:33:31 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:58914)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAOTV-0004bI-8C
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 12:33:25 -0400
Received: by obbwd20 with SMTP id wd20so907533obb.4
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2012 09:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=0YmJkMe0orKRfGtggPzlitGn783EAm5b8LldCniMc7w=;
	b=OufsFhAxWpp3/sRodq1MM/5NPoiJhNNMdjZyRa8cvfl528BLQ6taZwUZEZ7E5jZrwT
	7zP/1tsKtEb7GNhqTVFZwAOlVS31nCYiCwpMe2wXJyykeXslVpbcr68tcjlPTQVmsgg8
	sl/tl60aqzVBcYhDpsxR5MYCgp+QcRoutt9kJvUbkIV12ewYq+BMyifS+1LCcYW0neiM
	0m9Mb+uZvSwv0efodUW8IS3y/rHEecNnM7/+jKalde56Regx4o3sKEUBYXzEjvmkRiLH
	rFBAzoGIKS+ytmVvrRsfRbGY/XWe4205PhcyuRTxwQG2I/n7YEzzfYkoRKbalX8FuXzK
	7eWg==
Received: by 10.182.139.106 with SMTP id qx10mr3067036obb.39.1332347603825;
	Wed, 21 Mar 2012 09:33:23 -0700 (PDT)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id w4sm2033141obx.2.2012.03.21.09.33.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 09:33:23 -0700 (PDT)
Message-ID: <4F6A02D1.9060404@codemonkey.ws>
Date: Wed, 21 Mar 2012 11:33:21 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
	<20120319113310.GD30033@stefanha-thinkpad.localdomain>
	<20120320004206.GB22089@truffala.fritz.box>
	<CAJSP0QU4azkZic4GM++uXtj91b_vdXT=TETXTr1AD0qXxii28A@mail.gmail.com>
	<20120320101947.GA19542@truffala.fritz.box>
	<20120321112615.GA15090@stefanha-thinkpad.localdomain>
	<20120321130852.GC21467@redhat.com>
	<4F69E8E1.8050004@codemonkey.ws>
	<20120321151043.GA22707@redhat.com>
	<4F69F05B.5010500@codemonkey.ws>
	<20120321161155.GA23460@redhat.com> <4F6A014A.90704@codemonkey.ws>
In-Reply-To: <4F6A014A.90704@codemonkey.ws>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQkL2eqHUTXapkxXH+3M54tkwklMpv1VmhETvEvzVA3EnyMchaja0DWQ41NoN69DcmFNsZOm
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
 virtio balloon device
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
X-List-Received-Date: Wed, 21 Mar 2012 16:33:38 -0000

On 03/21/2012 11:26 AM, Anthony Liguori wrote:
> On 03/21/2012 11:11 AM, Michael S. Tsirkin wrote:
>> Frankly I don't see value in making it visible to the user,
>> at all. We are just triggering windows reactivations
>> without any user benefit. Why not return a fixed value there
>> to avoid that?
>
> I don't see a problem making it fixed for 1.1, but for 1.0 and older, we should
> expose what we were supposed to expose.
>
> We need to fix the bug first, then we can change the behavior.

In some cases, like USB, we really do want to expose a version, but we should 
probably only expose the major version, for instance, QEMU 1.x or 2.x.  This 
would only be exposed by the appropriate machine types.

Regards,

Anthony Liguori

>
> Regards,
>
> Anthony Liguori
>
>>
>>>>>>
>>>>>>
>
>


