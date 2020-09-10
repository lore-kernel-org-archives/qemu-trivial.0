Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGEWr-0005SE-Ot
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 00:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGEWp-0005N7-53
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 00:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGEWn-0003gi-0G
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 00:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599713383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3HkbJuqMJS9cUibAcrgZFAZDRZGtwhpDHWfgoWu3EI=;
 b=YxD0A8jUPAsMQDWM2npTXPmJp+7IF4zeCngwYTZwYusdvcHs/HwOlQZzKUjMcrfJbB/qSU
 At9DTtWP4z+qxwo3EZMwv4SaBrK77bQr96Qx2w32ydkYEdPFIBOqbFmoxIOLaIh6HCp6zD
 9mdADRVcYDF2n4QrBSDbeTeUZUY9Knk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-vLD6RxL7NMKMZRn-vlDfvQ-1; Thu, 10 Sep 2020 00:49:41 -0400
X-MC-Unique: vLD6RxL7NMKMZRn-vlDfvQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 744E31882FB5;
 Thu, 10 Sep 2020 04:49:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-86.ams2.redhat.com [10.36.112.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A574F5C22E;
 Thu, 10 Sep 2020 04:49:33 +0000 (UTC)
Subject: Re: [PATCH] test-vmstate: remove unnecessary code in
 match_interval_mapping_node
To: Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 dgilbert@redhat.com, f4bug@amsat.org, zhang.zhanghailiang@huawei.com,
 kuhn.chenqun@huawei.com
References: <20200910023818.11880-1-pannengyuan@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <459acccd-f501-865f-03cd-796cfb2a4502@redhat.com>
Date: Thu, 10 Sep 2020 06:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910023818.11880-1-pannengyuan@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 00:49:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.576, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 04:49:47 -0000

On 10/09/2020 04.38, Pan Nengyuan wrote:
> 'str' is not used in match_interval_mapping_node(), remove it.
> 
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
>  tests/test-vmstate.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
> index f8de709a0b..1c763015d0 100644
> --- a/tests/test-vmstate.c
> +++ b/tests/test-vmstate.c
> @@ -1055,9 +1055,6 @@ static gboolean match_interval_mapping_node(gpointer key,
>      TestGTreeMapping *map_a, *map_b;
>      TestGTreeInterval *a, *b;
>      struct match_node_data *d = (struct match_node_data *)data;
> -    char *str = g_strdup_printf("dest");
> -
> -    g_free(str);
>      a = (TestGTreeInterval *)key;
>      b = (TestGTreeInterval *)d->key;
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


