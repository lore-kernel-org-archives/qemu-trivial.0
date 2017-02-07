Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7Vx-00022R-Sa
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:17:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cb7Vt-0001y3-4w
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:17:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cb7Vp-0007p9-1e
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 10:17:01 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:21495 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1cb7Vk-0007Mx-2s; Tue, 07 Feb 2017 10:16:52 -0500
IronPort-PHdr: =?us-ascii?q?9a23=3APctOXhc6qbH+7p5i5YDiiM79lGMj4u6mDksu8pMi?=
	=?us-ascii?q?zoh2WeGdxcS9YR7h7PlgxGXEQZ/co6odzbGH7+awASddvd6oizMrSNR0TRgLiM?=
	=?us-ascii?q?EbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ/iOgVr?=
	=?us-ascii?q?O+/7BpDdj9it1+C15pbffxhEiCCzbL52Ixi6twbcutUZjYZiJas61wfErGZPd+?=
	=?us-ascii?q?lK321jOEidnwz75se+/Z5j9zpftvc8/MNeUqv0Yro1Q6VAADspL2466svrtQLe?=
	=?us-ascii?q?TQSU/XsTTn8WkhtTDAfb6hzxQ4r8vTH7tup53ymaINH2QLUpUjms86tnVBnlgz?=
	=?us-ascii?q?ocOjUn7G/YlNB/jKNDoBKguRN/xZLUYJqIP/Z6Z6/RYM8WSXZEUstXSidPAJ6z?=
	=?us-ascii?q?b5EXAuQBI+hWsovyp1UAohWwBgejC//gxyRUhnPqx6A2z/gtHBva0AEmAtkAsG?=
	=?us-ascii?q?7UrNLwNKoKTe21yLLHwivZb/NK3jf29YnGfQo7of6QXLJ/a9faxE40GAzblFWQ?=
	=?us-ascii?q?tYvlMiiU1uQCqWeb6+tgWvi1h2E7rAFxpyGiy8ExgYfKnoIY0lTJ+ThjzIooON?=
	=?us-ascii?q?G1SlR3bNqgHZdKqi2XN4t7T8U/SG9yoik60KcJuZujcSgPz5Qo2gDQZuScc4iN?=
	=?us-ascii?q?/hLjTOGRISpkhH59eLKwmRKy8U+4x+3yTMa01ldLritDktbSrHwN1hPT5dKDSv?=
	=?us-ascii?q?t85EitwyqA1wfW6u1cIEA0k7TUK4I5z7M0i5Yfq1nPEjL0lUnsiKKbcl8o9vWo?=
	=?us-ascii?q?5unnernmo4WTN45wigHwKKQuncm/DPwjPQcQRWib5eO82abi/U32WrpKivw2nb?=
	=?us-ascii?q?PDvJ/GIsQbo7a1AxVJ3YY79xa/EzCm3cwCknkdKVJKYwiHj5XyNlHUPv/3EPe/?=
	=?us-ascii?q?jE6wkDtx2//GObjhCI3XLnffiLfhYap960lExQoq099f4o9UBqgcL/3tRE/+qt?=
	=?us-ascii?q?jYAwQ/MwyzxebnB9N91p4EVWKIGK+ZP7vYsUWU6eI3P+mMeIgVtS7kK/c74v7u?=
	=?us-ascii?q?kGY1mUMHfamow5sXaWq3HvB9LkWfZnrshNgBEWEXvgYkS+zqklKCAnZvYCOXVr?=
	=?us-ascii?q?g/+ypzIZijB53eXZygmvTV1T2+FIdLTnpLBlCFDTHjcIDSCNkWbyfHC8trnyYY?=
	=?us-ascii?q?UvCOQpUq1Bjm4AX30aZgBuvb8ykZvNTo090jtL6brg076TEhV5fV6GqKVWwh2z?=
	=?us-ascii?q?pQHzI=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B8BAAR5JlY/5tjdVtdGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFQEBAQECAQEBAQgBAQEBgyaQPI9wAQEBAQEBAQWBIZMnhBuFEoEQAoJ?=
	=?us-ascii?q?RQxQBAQEBAQEBAQEBAWEogjMbAYIaAQEBAQIBJ1IFCwsOCgklDwEsDQENBol5B?=
	=?us-ascii?q?QwBsU06i1cBAQEBAQEEAQEBASSGCIUzhD6FXB8Fm2ujEZMPNiF+HxMIFRWGfz+?=
	=?us-ascii?q?JKQEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2B8BAAR5JlY/5tjdVtdGgEBAQECAQEBAQgBAQEBFQEBAQE?=
	=?us-ascii?q?CAQEBAQgBAQEBgyaQPI9wAQEBAQEBAQWBIZMnhBuFEoEQAoJRQxQBAQEBAQEBA?=
	=?us-ascii?q?QEBAWEogjMbAYIaAQEBAQIBJ1IFCwsOCgklDwEsDQENBol5BQwBsU06i1cBAQE?=
	=?us-ascii?q?BAQEEAQEBASSGCIUzhD6FXB8Fm2ujEZMPNiF+HxMIFRWGfz+JKQEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,346,1477954800"; d="scan'208";a="108326270"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 Feb 2017 16:16:13 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cb7V7-0004VY-GL; Tue, 07 Feb 2017 16:16:13 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1cb7V7-0003Ua-Ds; Tue, 07 Feb 2017 16:16:13 +0100
From: Alberto Garcia <berto@igalia.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
In-Reply-To: <87wpd211e0.fsf@dusky.pond.sub.org>
References: <20170127094154.19778-1-berto@igalia.com>
	<87wpd211e0.fsf@dusky.pond.sub.org>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
	(i586-pc-linux-gnu)
Date: Tue, 07 Feb 2017 16:16:13 +0100
Message-ID: <w51zihyjaki.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Clarify that -vga
 std is now the default
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
X-List-Received-Date: Tue, 07 Feb 2017 15:17:05 -0000

On Tue 07 Feb 2017 04:11:51 PM CET, Markus Armbruster wrote:
>>  Cirrus Logic GD5446 Video card. All Windows versions starting from
>>  Windows 95 should recognize and use this graphic card. For optimal
>>  performances, use 16 bit color depth in the guest and the host OS.
>> -(This one is the default)
>> +(This card was the default before QEMU 2.2)
>>  @item std
>>  Standard VGA card with Bochs VBE extensions.  If your guest OS
>>  supports the VESA 2.0 VBE extensions (e.g. Windows XP) and if you want
>>  to use high resolution modes (>= 1280x1024x16) then you should use
>> -this option.
>> +this option. (This card is the default since QEMU 2.2)
>>  @item vmware
>>  VMWare SVGA-II compatible adapter. Use it if you have sufficiently
>>  recent XFree86/XOrg server or Windows guest with a driver for this
>
> Do we want to cover history in the user manual?  Or should we simply
> move the "(This one is the default)" phrase?

> Hmm, the default seems to depend on the machine type:
>
>     if (default_vga) {
>         if (machine_class->default_display) {
>             vga_model = machine_class->default_display;
>         } else if (vga_interface_available(VGA_CIRRUS)) {
>             vga_model = "cirrus";
>         } else if (vga_interface_available(VGA_STD)) {
>             vga_model = "std";
>         }
>     }
>
> The pc-*-2.2 and newer set ->default_display = "std".

Right, if you set e.g. pc-i440fx-1.7 you'll get a cirrus card, that's
why I thought it was worth mentioning that older versions had a
different default.

But I'm fine either way to be honest.

Berto

