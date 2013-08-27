Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEPGP-0006Nb-DL
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2013 15:49:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEPGF-0005vT-V0
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1VEPG7-0008N6-HL
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 15:49:07 -0400
Received: from mail-ye0-x22d.google.com ([2607:f8b0:4002:c04::22d]:50041)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1VEPFq-0008L3-I3; Tue, 27 Aug 2013 15:48:42 -0400
Received: by mail-ye0-f173.google.com with SMTP id g12so1310008yee.4
	for <multiple recipients>; Tue, 27 Aug 2013 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=d8EcAQezZ3Wibg7RHzLV0yCH1ytqClWENaRmsX4ekOw=;
	b=Pi5WIVKXwomwmZ4LHemLDgE+rHlBZd1BCO24N0uaC7K34CaRvH56tABAFhkytLrA+O
	lpa1LGAr08ISFQb2pb3+SSH9DoP3dEhVx64XFLi4ddhLjtZYr+I0ZdNpQXxA+hU7ejYU
	Fttp8OBMLCfPilyTHGqOOPlI4Fy5medYZuMUVRi8RmCHCHomOC0KcNqdRSYbO7K4DaaO
	EEqskX1FbPvzRzi2iKqrt8EmIfyqghHV2Rx80nOnnyUXNMhBCGvEK3/pPwLkliPYDhFs
	nbtljrJ7GKXPkXEUGGgcTH1bSwHj9v2WLRSEFfeIwDJP/pjTXgn0rYZFHPJUbVk+WKEH
	fb3g==
X-Received: by 10.236.181.194 with SMTP id l42mr21208070yhm.26.1377632921952; 
	Tue, 27 Aug 2013 12:48:41 -0700 (PDT)
Received: from anchor.twiddle.net
	(50-194-63-110-static.hfc.comcastbusiness.net. [50.194.63.110])
	by mx.google.com with ESMTPSA id
	f67sm26358170yhi.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 12:48:40 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <521D028F.1070505@twiddle.net>
Date: Tue, 27 Aug 2013 12:48:31 -0700
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Yongbok Kim <yongbok.kim@imgtec.com>
References: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
In-Reply-To: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c04::22d
Cc: qemu-trivial@nongnu.org, james.hogan@imgtec.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: fix
 get_physical_address() #if 0 build error
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
X-List-Received-Date: Tue, 27 Aug 2013 19:49:16 -0000

On 08/27/2013 09:48 AM, Yongbok Kim wrote:
>  #if 0
> -    qemu_log(TARGET_FMT_lx " %d %d => " TARGET_FMT_lx " %d (%d)\n",
> +    qemu_log(TARGET_FMT_lx " %d %d => %" HWADDR_PRIx " %d (%d)\n",
>              address, rw, access_type, *physical, *prot, ret);
>  #endif

While by itself correct, consider converting this to the trace infrastructure
(with uint64_t instead of hwaddr).

If it's not worth a trace, it's probably not worth keeping at all.


r~

