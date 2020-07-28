Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k0RLm-0003gv-MG
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jul 2020 11:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0RLl-0003d3-2C
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 11:17:05 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42066
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k0RLi-0000Y6-Mo
 for qemu-trivial@nongnu.org; Tue, 28 Jul 2020 11:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595949421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dM94Xaz1NxuD9p5SZkbxYD83WyMjyQ8SEHfH4LK1oLg=;
 b=ivyvgNrNsow67Fx7quC9eVo7zjfsAPyCmVinwQjOdRngehp39rZu0shoR73nfwg25Y8bNa
 z0u5ECA1jjsHV1BBRiK7tdQX06NHS8WlYGbCAs/Gpa/Ff9II6OBpSBFsXnjpHpWu0TUsr8
 vqDXvG8RsI0e4y0BSQlyPm/hqYn4yQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Mo6xYo90NLCV0PKA93r4ww-1; Tue, 28 Jul 2020 11:16:56 -0400
X-MC-Unique: Mo6xYo90NLCV0PKA93r4ww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC1D91272;
 Tue, 28 Jul 2020 15:16:55 +0000 (UTC)
Received: from [10.10.118.248] (ovpn-118-248.rdu2.redhat.com [10.10.118.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C7D10013C4;
 Tue, 28 Jul 2020 15:16:54 +0000 (UTC)
Subject: Re: [PATCH] osdep.h: Add doc comment for qemu_get_thread_id()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200716154114.10838-1-peter.maydell@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0f8b8fea-2bd0-7616-292b-8fb0f87cec75@redhat.com>
Date: Tue, 28 Jul 2020 10:16:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716154114.10838-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 28 Jul 2020 15:17:05 -0000

On 7/16/20 10:41 AM, Peter Maydell wrote:
> Add a documentation comment for qemu_get_thread_id(): since this
> is rather host-OS-specific it's useful if people writing the
> implementation and people thinking of using the function know
> what the purpose and limitations are.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Based on conversation with Dan on IRC, and prompted by the recent
> patch to add OpenBSD support.
> 
> Q: should we document exactly what the thread-id value is for
> each host platform in the QMP documentation ? Somebody writing
> a management layer app should ideally not have to grovel through
> the application to figure out what they should do with the
> integer value they get back from query-cpus...
> 
>   include/qemu/osdep.h | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)

Do we need a counterpart change...

> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 4841b5c6b5f..8279f72e5ed 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -515,6 +515,20 @@ bool qemu_has_ofd_lock(void);
>   
>   bool qemu_write_pidfile(const char *pidfile, Error **errp);
>   
> +/**
> + * qemu_get_thread_id: Return OS-specific ID of current thread
> + *
> + * This function returns an OS-specific identifier of the
> + * current thread. This will be used for the "thread-id" field in
> + * the response to the QMP query-cpus and query-iothreads commands.

...to the qapi definition of query-cpus and query-iothreads?

> + * The intention is that a VM management layer application can then
> + * use it to tie specific QEMU vCPU and IO threads to specific host
> + * CPUs using whatever the host OS's CPU affinity setting API is.
> + * New implementations of this function for new host OSes should
> + * return the most sensible integer ID that works for that purpose.
> + *
> + * This function should not be used for anything else inside QEMU.
> + */
>   int qemu_get_thread_id(void);

Otherwise this change looks sensible to me.

Reviewed-by: Eric Blake <eblake@redhat.com>

>   
>   #ifndef CONFIG_IOVEC
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


