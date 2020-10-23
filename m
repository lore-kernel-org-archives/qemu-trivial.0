Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kW01n-0004uJ-4y
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2020 12:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kW01m-0004sF-57
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 12:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kW01j-0001sh-QO
 for qemu-trivial@nongnu.org; Fri, 23 Oct 2020 12:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603470889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Na1aWK7eXe+1cqqUA5T/DqJsLnli8rKHZRR7NMxWXIc=;
 b=cHj0Ca1QHb+mGqTCWXZcyxZQDAS12EUV7bP1g9f6tDwXp2N7jEqe3As07Fz4jdcoB9eO09
 OqraB1W+mX54w8+N7mSekVbVfDXve2tpcEzuR3fy3v2DKHHfq8kell5FvP4Vufa9MN37n6
 wCz7SmD8nQD/xK7CgVPFlyNyabrfCFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-oAXdRLaVOlKnWdGa8DBvEg-1; Fri, 23 Oct 2020 12:34:46 -0400
X-MC-Unique: oAXdRLaVOlKnWdGa8DBvEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E9F835BB9;
 Fri, 23 Oct 2020 16:34:44 +0000 (UTC)
Received: from [10.10.119.13] (ovpn-119-13.rdu2.redhat.com [10.10.119.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BB815C1CF;
 Fri, 23 Oct 2020 16:34:44 +0000 (UTC)
Subject: Re: [PATCH] CHANGELOG: remove disused file
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
References: <20201022162843.1841780-1-jsnow@redhat.com>
 <576a881d-2c64-3e40-31b7-43680a1988f8@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <22839fc4-a1b9-0510-ff19-3a713fd8a187@redhat.com>
Date: Fri, 23 Oct 2020 12:34:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <576a881d-2c64-3e40-31b7-43680a1988f8@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:46:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.108, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 23 Oct 2020 16:34:54 -0000

On 10/23/20 1:43 AM, Thomas Huth wrote:
> On 22/10/2020 18.28, John Snow wrote:
>> There's no reason to keep this here; the versions described are
>> ancient. Everything here is still mirrored on
>> https://wiki.qemu.org/ChangeLog/old if anyone is curious; otherwise, use
>> the git history.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   Changelog | 580 ------------------------------------------------------
>>   1 file changed, 580 deletions(-)
>>   delete mode 100644 Changelog
>>
>> diff --git a/Changelog b/Changelog
>> deleted file mode 100644
>> index f7e178ccc01..00000000000
>> --- a/Changelog
>> +++ /dev/null
>> @@ -1,580 +0,0 @@
>> -This file documents changes for QEMU releases 0.12 and earlier.
>> -For changelog information for later releases, see
>> -https://wiki.qemu.org/ChangeLog or look at the git history for
>> -more detailed information.
> 
> I agree with removing the old log. But should we maybe leave a pointer to
> https://wiki.qemu.org/ChangeLog / the git history here to let people know
> how to see the changelogs?
> 
>   Thomas
> 

Maybe in README.rst, just below "Bug Reporting" and above "Contact" ?


Changelog
=========

For version history and release notes, please visit 
`<https://wiki.qemu.org/ChangeLog/>`_ or look at the git history for 
more detailed information.


