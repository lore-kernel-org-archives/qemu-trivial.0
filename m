Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzgrW-0006fY-Mx
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 09:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgrL-0006Xl-60
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 09:10:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kzgrF-0005RU-Qj
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 09:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610547044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aLo0SpRidHM7SMc4CGxey3O8zQq3ylJydy3iBtqDP/w=;
 b=hqhiAUJYyC//ONggmQ3ySfjikVB1QTcMf1bESx7zwf/nRq1YUQeapIgm3KjyPRj+d7j8db
 mMaMCQM5fPx7UqAwNxETyV/xF5AqKInrhXK4iz/WlMVwT60myruaAf/7zRFFSrw2lTTWYy
 ZKsG4/9kQ2+Wysh0BY3ypw9tDYbbhDk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-DoktaxcFNBWxVkveoUzobQ-1; Wed, 13 Jan 2021 09:10:41 -0500
X-MC-Unique: DoktaxcFNBWxVkveoUzobQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54FF184A5E5;
 Wed, 13 Jan 2021 14:10:24 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D30860C5D;
 Wed, 13 Jan 2021 14:10:22 +0000 (UTC)
Subject: Re: [PATCH v3 6/7] qapi: Use QAPI_LIST_APPEND in trivial cases
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 "open list:Trivial patches" <qemu-trivial@nongnu.org>
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-7-eblake@redhat.com>
 <fa884130-89f7-2e54-a9ac-b23979da7446@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <750b9231-82c5-7717-9ace-c7839ad4d6ee@redhat.com>
Date: Wed, 13 Jan 2021 08:10:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <fa884130-89f7-2e54-a9ac-b23979da7446@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
X-List-Received-Date: Wed, 13 Jan 2021 14:10:55 -0000

On 12/24/20 3:56 AM, Vladimir Sementsov-Ogievskiy wrote:
> 24.12.2020 01:11, Eric Blake wrote:
>> The easiest spots to use QAPI_LIST_APPEND are where we already have an
>> obvious pointer to the tail of a list.  While at it, consistently use
>> the variable name 'tail' for that purpose.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
> 
> [..]
> 
>> --- a/monitor/qmp-cmds-control.c
>> +++ b/monitor/qmp-cmds-control.c
>> @@ -104,17 +104,16 @@ VersionInfo *qmp_query_version(Error **errp)
>>
>>   static void query_commands_cb(const QmpCommand *cmd, void *opaque)
>>   {
>> -    CommandInfoList *info, **list = opaque;
>> +    CommandInfo *info;
>> +    CommandInfoList **tail = opaque;
>>
>>       if (!cmd->enabled) {
>>           return;
>>       }
>>
>>       info = g_malloc0(sizeof(*info));
>> -    info->value = g_malloc0(sizeof(*info->value));
>> -    info->value->name = g_strdup(cmd->name);
>> -    info->next = *list;
>> -    *list = info;
>> +    info->name = g_strdup(cmd->name);
>> +    QAPI_LIST_APPEND(tail, info);
> 
> Original logic is prepend in this hunk.
> 

Good catch; looks like it should be folded in with the remainder of
patch 4/7 on the respin.

> Without this hunk:
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 
>>   }
>>
>>   CommandInfoList *qmp_query_commands(Error **errp)
> 
> [..]
> 
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4817,20 +4817,17 @@ static void x86_cpu_filter_features(X86CPU
>> *cpu, bool verbose);
>>
>>   /* Build a list with the name of all features on a feature word
>> array */
>>   static void x86_cpu_list_feature_names(FeatureWordArray features,
>> -                                       strList **feat_names)
>> +                                       strList **tail)
>>   {
>>       FeatureWord w;
>> -    strList **next = feat_names;
>>
>>       for (w = 0; w < FEATURE_WORDS; w++) {
>>           uint64_t filtered = features[w];
>>           int i;
>>           for (i = 0; i < 64; i++) {
>>               if (filtered & (1ULL << i)) {
>> -                strList *new = g_new0(strList, 1);
>> -                new->value = g_strdup(x86_cpu_feature_name(w, i));
>> -                *next = new;
>> -                next = &new->next;
>> +                QAPI_LIST_APPEND(tail,
>> +                                 g_strdup(x86_cpu_feature_name(w, i)));
> 
> actually, fit in one line...
> 
>>               }
>>           }
>>       }
> 
> [..]
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


