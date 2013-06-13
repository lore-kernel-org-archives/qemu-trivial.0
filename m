Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmvXz-0002BA-VF
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 20:37:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umv5o-0001Sk-Fo
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 20:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umv5l-0001Ks-HP
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 20:08:44 -0400
Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229]:40098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Umv5l-0001KU-AG
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 20:08:41 -0400
Received: by mail-pa0-f41.google.com with SMTP id bj3so6228717pad.0
	for <qemu-trivial@nongnu.org>; Wed, 12 Jun 2013 17:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=k3GGPtD0phaELgENFovcqCy/ANnthXJzREScJDXBvu4=;
	b=WdllxwAxC9y/bh/Dv0DLtennjsjvXgTktvILGzYPm7eyykwpkr7EZzO+NolHhPIouN
	mB5m0y7e/F9CSIQYCNpixGRuQ7e4wj1IrEPyEu/isrlsxuMK97arxNnRMgp831TBpZ+X
	YiabtP75dA55aCGD7BDhPZeKmnF3gg0/+9AIld3O1gnPo+qvpP1wDWfx6d/czJiLWRor
	NeKCycpwb6bwI+VkXOU4oJoNcYN9Lwuai8al3wA+O3MwN6SR4UvCakPFu2yFWfIeUJjE
	4QDgG62Dt4z+efyW7zCVp35xgOhqJj6e1GTUT3TISPx9kvnIZok6+D6KgleR69k1xjt2
	4aew==
X-Received: by 10.66.0.97 with SMTP id 1mr277309pad.201.1371082119688;
	Wed, 12 Jun 2013 17:08:39 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id
	ag4sm20905960pbc.20.2013.06.12.17.08.35 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 17:08:38 -0700 (PDT)
Message-ID: <51B90D81.1020000@ozlabs.ru>
Date: Thu, 13 Jun 2013 10:08:33 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Alexander Graf <agraf@suse.de>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
	<9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
In-Reply-To: <9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQkMNFPIbCiLKEZd/3tXjBhIGD7u1YC7eP7OlvV3zsiTEi9VZd0qDeP2cc6I0vXdyFMj/1Yb
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::229
X-Mailman-Approved-At: Wed, 12 Jun 2013 20:37:49 -0400
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] spapr: add yet another maintainer
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
X-List-Received-Date: Thu, 13 Jun 2013 00:08:46 -0000

On 06/13/2013 12:33 AM, Alexander Graf wrote:
> 
> On 12.06.2013, at 16:27, Alexey Kardashevskiy wrote:
> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> MAINTAINERS |    1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 13c0cc5..1e00bb1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
>> sPAPR
>> M: David Gibson <david@gibson.dropbear.id.au>
> 
> David should get removed here then, no?

Well, at least sometime he is a qemu-ppc maintainer :) Don't know and I am
not the one to decide.


> 
> 
> Alex
> 
>> M: Alexander Graf <agraf@suse.de>
>> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
>> L: qemu-ppc@nongnu.org
>> S: Supported
>> F: hw/*/spapr*
>> -- 
>> 1.7.10.4
>>
> 


-- 
Alexey

