Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8CbM-0005r7-GK
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 13:42:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8CbG-0005n8-SR
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:42:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8CbF-0007Aq-Gz
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:41:58 -0500
Received: from fofx.invlim.com ([71.6.153.225]:52145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>)
	id 1Y8Cb8-00078j-S3; Mon, 05 Jan 2015 13:41:51 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by fofx.invlim.com (Postfix) with ESMTP id 91717248288;
	Mon,  5 Jan 2015 10:31:44 -0800 (PST)
X-Virus-Scanned: amavisd-new at example.com
Received: from fofx.invlim.com ([127.0.0.1])
	by localhost (fofx.invlim.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eM91PK0HpKUr; Mon,  5 Jan 2015 10:31:42 -0800 (PST)
Received: from [10.240.0.46] (unknown [10.240.0.46])
	by fofx.invlim.com (Postfix) with ESMTP id 5848624827F;
	Mon,  5 Jan 2015 10:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=invlim.com;
	s=default; t=1420482702;
	bh=4+lrKPNlQpCKGt3oQ51+ZNltWCikcgF5Jky+lSbZ3tc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BCInMdLCZDIY2xozACwyyIFQGVu1vNxy3oHxmO6ITBDLZ0ZPekkiFI8N4D46cKk9K
	80Q1veaIjw/v/8RmLSi+UB7kb81Awft7o0sv901hzTrQfVLija1uyrYEe+frsdxY69
	+mEvv2LvoAL6l7id5hmgfvKJbLqKmbO+Svzqx7Fc=
Message-ID: <54AADADB.6000400@invlim.com>
Date: Mon, 05 Jan 2015 10:41:31 -0800
From: David Morrison <dmorrison@invlim.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
	<CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
In-Reply-To: <CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 71.6.153.225
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Ethan Hunt <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-openrisc: bugfixes
 for debugging with GDB+Qemu on OpenRISC
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
X-List-Received-Date: Mon, 05 Jan 2015 18:42:00 -0000

Hi, Peter,

Thanks for the response.  I'll split out the changes into separate 
commits and resubmit.  I do have one question here:

>
>> diff --git a/target-openrisc/mmu.c b/target-openrisc/mmu.c
>> index 750a936..bbd05f1 100644
>> --- a/target-openrisc/mmu.c
>> +++ b/target-openrisc/mmu.c
>> @@ -219,7 +219,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>>       hwaddr phys_addr;
>>       int prot;
>>
>> -    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
>> +    if (cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0)) {
>
> This looks wrong -- we won't do the virtual-to-physical
> translation on the addresses provided by the debugger if
> we use the _nommu() function. You definitely need to be
> doing a v-to-p translation here somehow.
>

I was similarly puzzled by this.  However, I've been comparing Qemu to 
or1ksim, which does not appear to do translation for the debugger; see 
the following code excerpt from the or1ksim source:

https://github.com/openrisc/or1ksim/blob/or1k-master/debug/rsp-server.c#L1546

rsp_read_mem (struct rsp_buf *buf)
{
...
   for (off = 0; off < len; off++)
     {
       unsigned char  ch;        /* The byte at the address */

       /* Check memory area is valid */
       ...

       // Get the memory direct - no translation.
       ch = eval_direct8 (addr + off, 0, 0);

       buf->data[off * 2]     = hexchars[ch >>   4];
       buf->data[off * 2 + 1] = hexchars[ch &  0xf];
     }

   buf->data[off * 2] = 0;           /* End of string */
   buf->len           = strlen (buf->data);
   put_packet (buf);

}   /* rsp_read_mem () */

Moreover, in Qemu if you perform the translation and use GDB to debug, 
it returns bogus values for the memory read, whereas not performing the 
translation appears to work correctly.  Am I doing something wrong here, 
or is this possibly a bug in the or1k toolchain instead?

Thanks for your help!
David

-- 
David R. Morrison, PhD
Inverse Limit
dmorrison@invlim.com
+1-217-417-9445

