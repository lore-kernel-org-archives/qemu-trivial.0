Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzgs6-0007Rr-W5
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 09:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgs3-0007Ne-UJ
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 09:11:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgs1-0005l1-67
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 09:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610547092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pHzpnwKStMEFsGGLIE9utnygk1K5Uj6YwoEeCas/4Sc=;
 b=cVLRtkA/HCRQPotZAsIF1h2IiHWB+nCGxz+9zwBHtkjTZ13Zxu45zAhn4bkpLtNHwrPYM/
 hNjuiRlClXVooU0cmCPcq/z72hXcRecmFFhlY7zmcziShLBLjq+72tlrMJermCRtZ1wtQX
 ef+xBwPMRYTZDP6Cm8hp0DD/HiAuyc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-moI_qcT9M1qKVI6g8fIx7A-1; Wed, 13 Jan 2021 09:11:27 -0500
X-MC-Unique: moI_qcT9M1qKVI6g8fIx7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C9ACE64C;
 Wed, 13 Jan 2021 14:11:25 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D19A460BF1;
 Wed, 13 Jan 2021 14:11:19 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] qapi: Use QAPI_LIST_APPEND in trivial cases
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-7-eblake@redhat.com>
 <87v9c1yo1t.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9c278f4e-5a81-b024-de00-18de9f9ff746@redhat.com>
Date: Wed, 13 Jan 2021 08:11:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87v9c1yo1t.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jan 2021 14:11:37 -0000

On 1/13/21 7:16 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> The easiest spots to use QAPI_LIST_APPEND are where we already have an
>> obvious pointer to the tail of a list.  While at it, consistently use
>> the variable name 'tail' for that purpose.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>

>> -void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>> +void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***tail)
>>  {
>>      int i;
> 
> Sure you want to rename the parameter?  What about:
> 
>    void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
>    {
>   +    ACPIOSTInfoList ***tail = list;
>        int i;

Reasonable.  I'll pick it up for v4.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


