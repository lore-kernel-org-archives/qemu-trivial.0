Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etSdD-0003f5-2l
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 01:32:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1etSdB-0003er-EY
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1etSd8-00038s-Af
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:32:53 -0500
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:37388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1etSd8-00038g-4P
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 01:32:50 -0500
Received: by mail-it0-x243.google.com with SMTP id k79so2032034ita.2
	for <qemu-trivial@nongnu.org>; Tue, 06 Mar 2018 22:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HDNYVf/t5DVE0z1J6RN6VkDUJyVJmQ6uoVCOWBVgHOY=;
	b=f9+mkPw5flKEUl+meBPvobYipWweo05B5vJpimaJ6uV6v0Rr0NFxNbPfVZxVrcULZG
	pVuMippfkHuTYPbSK3e0CXSe7B/nd9E7mu6dKpp8o0WrC+rei+jqqsWt6ElzaIfzFvMY
	XnBgkwTXKw9NZ7Tmpag/Hw1Rj1NiRXgOuGxd9Et82hGtD31i38bhLPO6o4eySvaqsxqX
	i01Jz1QS/1YhEzRM1q6VdqM6kHshB7YettTcirlJJcoi4RziO8YjvgVKryRsnP7CO/8P
	KZZMRkv996OlquH5lwbSNcw9nKOa0j+4nx3gUVCWl7zn7sQvECsQKtXNyaUc9Xyxkgx9
	lolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HDNYVf/t5DVE0z1J6RN6VkDUJyVJmQ6uoVCOWBVgHOY=;
	b=KPdi74uwKij7zNlHDxuR9cW0QsdO5Zp0KVL/2BgjuIlnGbnIMZGVj1lO+rqyeUT0YD
	wZEHbwsk/Gw1ShisSAM8Cb4kEu/JhnvL2uKP7AQ97JiHV2GByr78tcbWqlPSD9/trIVH
	bdueJb/3CqAU7TRQ56jGSV5u5uAcC+toGySqoF8XIX7BL8cjcBQF5N8dqeG12SV2VeEs
	OJII7/KIBf1cxDDROIavjGpGtY/6YCDFXCrCth/Qwt0WWe0PkMUuDtUpDvJi0M62azaS
	Fk9qNrT1Le+hs+m5tukd/F5moaYTYYVrTByERuq3djIPo+C1KtLcFJLixEWFJfVZopHO
	xfxA==
X-Gm-Message-State: AElRT7HJel1lJWM+tyijZ4UFrSbVnpJl9zwzg+8il4iHF/HFtAhTy9Oo
	cNEuolrOZgSmGiOIpvyMF2llwA==
X-Google-Smtp-Source: AG47ELusmmlKWFzlPRtLzTpFQhbFwUJlw45/vLLEtQv7EJJpcuxfZqY/bJbsnw1UxYjm6/EaHX8icA==
X-Received: by 10.36.160.136 with SMTP id o130mr21320982ite.37.1520404369505; 
	Tue, 06 Mar 2018 22:32:49 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
	by smtp.googlemail.com with ESMTPSA id
	h90sm11521410ioi.61.2018.03.06.22.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 22:32:48 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20180201093545.33741-1-aik@ozlabs.ru>
	<38e2df74-c7d7-a062-8385-494adae0ef89@ozlabs.ru>
	<727e34b6-0f7f-bd0c-9a34-51d5bc844c73@redhat.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <e878fb8c-e33b-54bc-545d-bd4a80d92a88@ozlabs.ru>
Date: Wed, 7 Mar 2018 17:32:44 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
	Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <727e34b6-0f7f-bd0c-9a34-51d5bc844c73@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH qemu] slirp/debug: Print IP
 addresses in human readable form
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
X-List-Received-Date: Wed, 07 Mar 2018 06:32:54 -0000

On 7/3/18 5:24 pm, Thomas Huth wrote:
> On 07.03.2018 04:38, Alexey Kardashevskiy wrote:
>> On 01/02/18 20:35, Alexey Kardashevskiy wrote:
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> Ping?
>>
>>
>>> ---
>>>  slirp/arp_table.c | 4 ++--
>>>  slirp/socket.c    | 8 ++++----
>>>  slirp/udp.c       | 4 ++--
>>>  3 files changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/slirp/arp_table.c b/slirp/arp_table.c
>>> index 3547043..bac608f 100644
>>> --- a/slirp/arp_table.c
>>> +++ b/slirp/arp_table.c
>>> @@ -33,7 +33,7 @@ void arp_table_add(Slirp *slirp, uint32_t ip_addr, uint8_t ethaddr[ETH_ALEN])
>>>      int i;
>>>  
>>>      DEBUG_CALL("arp_table_add");
>>> -    DEBUG_ARG("ip = 0x%x", ip_addr);
>>> +    DEBUG_ARG("ip = %s", inet_ntoa(*(struct in_addr *)&ip_addr));
> 
> Is this endianness safe? The man-page of inet_ntoa says that the
> function is expecting network byte order, so I wonder whether this works
> right on both, big and little endian hosts?



arp_table_add() is called for either sin_addr (network order) or
slirp_arphdr::ar_sip which is initialized from sin_addr (network order)
with no order conversion. Bugs are still possible, of course :)


-- 
Alexey

