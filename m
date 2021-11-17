Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnRT3-00028k-IH
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 15:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRSz-00024X-8L
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 15:23:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRSx-0005KE-HH
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 15:23:36 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHJjlef004024; 
 Wed, 17 Nov 2021 20:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : reply-to : subject : to : cc : references : from :
 in-reply-to : content-type : content-transfer-encoding; s=pp1;
 bh=0K7u8gbg2rAclcR1K4EWDG+5wqXNCsFvB0n2MJy41yw=;
 b=EThfD/KNC054cGcDZCmn/pJQP2AkN0wbaZ6Dx+vmncREtLqkQEtvv9uvgC7LmGZRPgNB
 XcHGmZH6RC3ucaTTIqtM6TkS8mlV1vvsvtCBO5k7WEiTNFbCP6/wW02v9jEBtuKTxSaD
 ZFwu/8lE0p0+UFV7XJ/YemPhEQ17eHUP9+rlVLTFpZA0HdWR2HscuI601by96ZmA81pM
 W1l1dnXHX4FNe0sBa1lDXyAlBhirTbx7lBsdsmI6x38yzsFx3warD64sPSEgvOt6wzb9
 W/JNcX3JQ+8bMWlh+Jhc5FY4hwNoyGxkNnVmni6/IQUzTr2yIuQT5t+HTxIrfXGacAO9 eA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd85v8svq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:23:33 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHKCr3D004664;
 Wed, 17 Nov 2021 20:23:31 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma05wdc.us.ibm.com with ESMTP id 3ca50c45hp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:23:31 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHKNU9m22413888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 20:23:30 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56C02C6062;
 Wed, 17 Nov 2021 20:23:30 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 873DAC605B;
 Wed, 17 Nov 2021 20:23:29 +0000 (GMT)
Received: from [9.160.118.240] (unknown [9.160.118.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 20:23:29 +0000 (GMT)
Message-ID: <c873365d-e644-465e-9499-2c918ed3803b@linux.ibm.com>
Date: Wed, 17 Nov 2021 17:23:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: lagarcia@br.ibm.com
Subject: Re: [PATCH] Fix typo in comment.
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-trivial@nongnu.org
References: <2833bf05e3c85267c5fefaab7326b58521da3896.1611685564.git.lagarcia@br.ibm.com>
 <da3ee880-33f5-d43f-6784-bb3d81b6c591@vivier.eu>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
In-Reply-To: <da3ee880-33f5-d43f-6784-bb3d81b6c591@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: egJxZlLYqILtQWcU8qLV8QeyjFRjIBeb
X-Proofpoint-ORIG-GUID: egJxZlLYqILtQWcU8qLV8QeyjFRjIBeb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170090
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Nov 2021 20:23:38 -0000

On 1/29/21 05:00, Laurent Vivier wrote:
> Le 26/01/2021 à 19:26, lagarcia@linux.ibm.com a écrit :
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>>  hw/virtio/vhost.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 28c7d78172..d6d290e79f 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -285,7 +285,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
>>       * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
>>       * incremental memory mapping API via IOTLB API. For platform that
>>       * does not have IOMMU, there's no need to enable this feature
>> -     * which may cause unnecessary IOTLB miss/update trnasactions.
>> +     * which may cause unnecessary IOTLB miss/update transactions.
>>       */
>>      return vdev->dma_as != &address_space_memory &&
>>             virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
>>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>
> Please, re-send your patch to qemu-devel@nongnu.org, this is the reference list.


Thanks for the guidance. I'll do that now, as no one did that in the
past months. :)


Cheers,


Leo


>
> Thanks,
> Laurent

