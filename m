Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1krJiQ-0000YU-LI
	for mharc-qemu-trivial@gnu.org; Mon, 21 Dec 2020 06:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJiP-0000Wc-Ai
 for qemu-trivial@nongnu.org; Mon, 21 Dec 2020 06:51:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krJiN-0004rP-Td
 for qemu-trivial@nongnu.org; Mon, 21 Dec 2020 06:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608551459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OndtFvQUcD7/YFafIb+v3NzR8dV9JcX3GlgryOuWkE=;
 b=NlR7zEEY/+vPSMUuluEvwypZKcoezkYYXfwKykYxa+et57xi8QAvNIa3j9H203Z+JbCccz
 StoZM70oxwTboUhEKKVwH5a90zSdhfIYIYZ6vYtiw6IhZgO9RfStZL7nS3H3s+LaDIejLN
 H7JK81bIjfjmycSLslGNTJz/Ed8eGhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-ue4tYmNRMPygQLwbkuuYUA-1; Mon, 21 Dec 2020 06:50:55 -0500
X-MC-Unique: ue4tYmNRMPygQLwbkuuYUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 110248015DD;
 Mon, 21 Dec 2020 11:50:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5389810021AA;
 Mon, 21 Dec 2020 11:50:52 +0000 (UTC)
Subject: Re: [PATCH v2 04/12] nvdimm: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: kuhn.chenqun@huawei.com, zhang.zhanghailiang@huawei.com,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-5-ganqixin@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2521d158-59f4-dd0f-b022-64f33dc3cf61@redhat.com>
Date: Mon, 21 Dec 2020 12:50:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130083630.2520597-5-ganqixin@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.299, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 21 Dec 2020 11:51:01 -0000

On 30/11/2020 09.36, Gan Qixin wrote:
> The category of the nvdimm device is not set, put it into the 'storage'
> category.
> 
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
> ---
>  hw/mem/nvdimm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
> index e1574bc07c..e30695b2ce 100644
> --- a/hw/mem/nvdimm.c
> +++ b/hw/mem/nvdimm.c
> @@ -236,6 +236,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
>  
>      nvc->read_label_data = nvdimm_read_label_data;
>      nvc->write_label_data = nvdimm_write_label_data;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
>  
>  static TypeInfo nvdimm_info = {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


