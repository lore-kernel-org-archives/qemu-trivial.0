Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAMkj-0000pW-PJ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2012 10:43:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAMkY-0000L8-28
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 10:43:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAMkQ-0004q4-ND
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 10:42:53 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:48173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SAMkQ-0004pp-Is
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2012 10:42:46 -0400
Received: by yhoo21 with SMTP id o21so1172562yho.4
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2012 07:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Gz2NtnaXM2nvc11NFIeiLoiPiuEvqqjW7z8ez1i22dw=;
	b=QU/lx7RZ1rttjf2Rl7woP4imWksZP2GeVFCkgDYkxg6yZuyjQGyCfAjt4hjMSrsFre
	JpWS2mkMIAkKhvcTKaeTRNZnoakPbLQXx5EEyzusxpvPO5N0hwdZQsaktI41SrYarpKv
	QFIU2RjK5XV46a925V8k3/Vb+WYtczu7LibBowGusJ357ZpwD7AyvicCUKKZtLq82DXb
	dAX3VUAlnWsfm4ZXySCvFKGS1zpQZ0PUp0udjGwEZrfyDZgABl+Z8cZ/batsMtPtXyt+
	+BnvMOmjPL2mHtE3oraRStRze7BCJ4uy7fyDQDDr998su9eXf9scTOliPwDvJTiiS0Uc
	wtxQ==
Received: by 10.60.7.196 with SMTP id l4mr5012076oea.8.1332340964808;
	Wed, 21 Mar 2012 07:42:44 -0700 (PDT)
Received: from [192.168.0.108] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id d6sm1338199oeh.3.2012.03.21.07.42.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 07:42:43 -0700 (PDT)
Message-ID: <4F69E8E1.8050004@codemonkey.ws>
Date: Wed, 21 Mar 2012 09:42:41 -0500
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
In-Reply-To: <20120321130852.GC21467@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQkIT4YCxHdXHdo2phSinRp+tXER/HrW2kaDoQyoVjcaYHRgjQcsvaT5bHv/VRHazIeIVZGB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
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
X-List-Received-Date: Wed, 21 Mar 2012 14:43:04 -0000

On 03/21/2012 08:08 AM, Michael S. Tsirkin wrote:
> On Wed, Mar 21, 2012 at 11:26:15AM +0000, Stefan Hajnoczi wrote:
>> On Tue, Mar 20, 2012 at 09:19:47PM +1100, David Gibson wrote:
>> Looking at hw/pc_piix.c there are QEMUMachine types for each QEMU
>> release.  Legacy machine types (e.g. pc_machine_v0_14) have a
>> .compat_props array that can override qdev properties.
>>
>> Perhaps Michael Tsirkin or someone else can comment on how to wire up
>> hw/virtio-pci.c so that the class code can be overridden.
>>
>> Stefan
>
> afaik we already let users over-write it for some other pci devices,
> look there for examples.

 From hw/pc_piix.c:

     .name = "pc-0.10",
     .desc = "Standard PC, qemu 0.10",
     .init = pc_init_pci_no_kvmclock,
     .max_cpus = 255,
     .compat_props = (GlobalProperty[]) {
         {
             .driver   = "virtio-blk-pci",
             .property = "class",
             .value    = stringify(PCI_CLASS_STORAGE_OTHER),
         },{

And from the earlier part of the thread, yes, it's imperative that we do not 
change anything in the PCI configuration space for older pc versions regardless 
of whether it may or may not work.

Certain guests (like Windows) use a complex fingerprinting algorithm to 
determine when hardware changes.  It can be hard to detect in simple testing 
because it's based on a threshold.

Regards,

Anthony Liguori

>
>


