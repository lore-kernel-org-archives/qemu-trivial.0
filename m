Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ozenE-0004wr-ST
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2022 09:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ozeV1-0004t5-0Y
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 08:48:43 -0500
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1ozeUy-0000HS-KY
 for qemu-trivial@nongnu.org; Mon, 28 Nov 2022 08:48:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRRjeMhbKtHDn7oAYD+lEyttvLx+f8CMhqol+zhEuBlkQAn+dROjXnP7avlzUNyBqzSBCtap8tUrFIilNIhoyn12fcqwHog3u4gW/roIzsO8Cyf4O94o6lo3g2NHIQ+6oUcSk776VlRy0BzaRpgBoF82fnMlpKTkKPNKK5H9iLV9paamsDThfN+liF6SaHd2RSt9jwFjGXzEgaPuUbNtqMkL2yBsAyydBN0Tl0YMPKY9K02QWN8UdNsOHnz/AAFZZEQLuSXPwKNXMeQcSTZsfxgxDIF5HXSw4snoFfzujzeG79U3eem/MuzHAJGV1vMgDL6i7ICtb0/vpAsQrBMRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TR4sh264ONzfZ8XaFZcTt6e0mJMeEITpyvN/g4M4SN0=;
 b=gxxYJWOp0/PL167hnlHgEGDC/gyBEBZEUxLxGwzJETDMyU2Z6pKa43IXMSoBbCcyFHuMLH2q1BrE2A+gK9ZGamKIvsL6w9Wx0OM6mMwdRoq9To9Y4qcm51ScfUsfuVsyaY1mrMcjYzXx7HRHcgJdb5asIJ7oho+iMyrqgKhGIHzmthc51U7JaGKyRPmY/6ta7MhAS5PU1+657YB8NJIL+/XUTWdTDQ8pU2CDAuhd18iCKNiXVEnydpPDl+DaLlmqjNKZDGMUiHo/bhaVz9ouXErVdVqHyUla5VOyynTm9nNIMLEx6SOLdGjF6ivgWTvhgfm1VpnGKISuVRYvT5xWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TR4sh264ONzfZ8XaFZcTt6e0mJMeEITpyvN/g4M4SN0=;
 b=zvmzcIgGmRr0PjXvbJMFdsqecRB/ifyJzzJ0fSPzX5KhNHCjG4f9RP7AnAU+GjegOhVqi4aesgtSuyLwMHTtW15r/eHxgILLbJaXl7ZImewdoit5rXfNVoPW9JEZrZmEQ3ReWI5ktHNXLyP2dfwWkUNnjCQWP9BloGeqYogsqAoRZCsUCdUXA/6RUg9WHHSfPSWZy2Ov/ZjWHsAYyIZ/U86g5uMiSPYF093O6VxG79eM5lz+iHZRcdomQqBTibqjT+B7fJYcYNfMCKtT/iO86vGyCF1vanZyHlHZxavym+LtSkIuxqQxn6PxJ1qZNSTKeFAVwiCayE/p2eFFmLXbrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DBBPR08MB6220.eurprd08.prod.outlook.com (2603:10a6:10:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 28 Nov
 2022 13:43:33 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::40c5:236f:183f:8fc4]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::40c5:236f:183f:8fc4%7]) with mapi id 15.20.5880.008; Mon, 28 Nov 2022
 13:43:32 +0000
Message-ID: <744b3c8f-b99b-bd12-c637-75fae4660544@virtuozzo.com>
Date: Mon, 28 Nov 2022 14:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] qga-win: replace libpcre with libpcre2 in MSI package
Content-Language: en-US
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>, qemu-trivial@nongnu.org
References: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0106.eurprd04.prod.outlook.com
 (2603:10a6:803:64::41) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|DBBPR08MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b31135-cadc-4de3-8c6c-08dad1468980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQkJY7LcJnJonu6FESSdZBNCMnJZMtLeaz/vAbm3XRLRx6zk6AeJ2g+VPJ5RZcgu6vmeLAYTSilGR0BGX3uHfOHmk2lmuQvwueupGRQXe3vIVBb0SaPrRvsfOnwBerTDkKitLfiBWLpuyRKzAjeSE9kN1aBqE5GK0FrScpUxwj3skAnTAGnEcK4QZmMUueNCpXA4D2RWoVK2GsRRuWtZ+XO6K53t6mw5VmA69ZpUT+YBi1TOMPfgtgHcOOdPye1E9PqOYCyjHWD+263DMhXhEB/z06vm16L24/SxLMi/Bq8Y1ke0Zxw1zhP1tavBr9VAfXyrVenYbLure1zQ+UEB87iDPsF3ZMpFlsxqfXDxyjAXYl8McmF4MaYJfqQvaXRSYSzINlqkN56ZZpeN/EJC1Mc36SfQuPrNxlbCYjxHKx+jWmGrZcl1AxYvN+Kdk9uwkx4qANmekhsoyho2jK1UrjkiDJt5g7epSR1zRFtfuOUu7imWfjCTk2PZM4c7IM2HF7FqGw/MnUx/T8cCiG4MZlZA5Kvurdd84woR7LVq+NjxXZzPAcAkkC3PgBOGb7lgLG8CXvGHTxAMa3Eq1trtULBK8jaYB9ReLY5oO+tfeqQ9LsX+SoRCnbCmePjdNUK+5p6gwQj7rW6kQXLdiKRIAzFb0AuZ7KUrYwxuNzjDRxfYqaZRThnbwmUbXDdcZLtToDd0iLJ0ehnNaoDyq5X5nyz3cXFD2eEa8TUn9Ahq2/Ih8iX6Xfd8sA0pWjlHlu13
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(451199015)(53546011)(36756003)(26005)(478600001)(6666004)(6506007)(6512007)(6486002)(966005)(41300700001)(66946007)(66556008)(8676002)(66476007)(31696002)(86362001)(316002)(2616005)(5660300002)(8936002)(186003)(38100700002)(31686004)(21480400003)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2VoY3hERE4xdlI4SE44Q282RVd0WVM4bFBBa3ZOaUtpL25LdlU2N2ZjVEFS?=
 =?utf-8?B?SjZIL21aR1FBMmdaWURJdklOQkV3bG5odVJXZ2tIK0kvOU1pNkhhSGVNYlB0?=
 =?utf-8?B?RVo4VSs2T1V1Y2ZTb25wNERBcWtNUVcxMURsdEp0MktCOU40NGUrcGt3dVp4?=
 =?utf-8?B?cVVlT1p5YVc2bFdrektMdUcvd1VKMFdCeGhUVzdHeExIcndsa0hZVE9NU2Nu?=
 =?utf-8?B?VHJWQmZ2UFloSDJzK3pELzE2ck05MGlKUTRCejRNTEVBUjhIQTdQUVdqOHUw?=
 =?utf-8?B?dWJFVTRBRVRmRnhYaG9oNVQyWlBHQ2lYWEVHd1g5czgxKzdiKzJXMUlWV0I5?=
 =?utf-8?B?dFhWQVV4NG9XSWV1eUVNV2ZHNmhKYUdHcmwydUV6aDZ1YXlwMkpYR3kzbGps?=
 =?utf-8?B?MXpyb0RZbkRmRE95dlViQS9VbTBpSndTY2o4Rldaa0pnYjhWK0RQKzhpcm92?=
 =?utf-8?B?RjIyT3RQRTRCQXNDOCtXZjFFOHBGSzRVYjhJVk83LzIzc0IzVU4wK1BSRW1o?=
 =?utf-8?B?TGxFQTdDclVXTEtaakZ2aVNzclpiZlZ0VmxUOTNvRkc5OCtyb0hEdEpUVUxx?=
 =?utf-8?B?bHE1c0ZKTVZ6ZEhaSzhmUGZjWkRua2J4K0dsV3NBcHYxcVNxNXpkQzBHYlN6?=
 =?utf-8?B?WHhJQ1VBU2JQc0F0b29lQm9FcXhkbmRFSTZUWUtuQTVMb0xrRVZEOERSRTVn?=
 =?utf-8?B?VjBaZm5FR0tGRlJMcXlIb05tZzJJQkp0dVVsWXZoQmJnWngxSmhsZDlub0dj?=
 =?utf-8?B?UU0xSU1LRHRMZnMyWmlIMVdZaFREaHA5c3p5eW1vdWs3UWlSVGExdEdVSVFO?=
 =?utf-8?B?MW5GV0FxNTJ2Wlo4QkFpemVXd2tLSVhWU0t5ckdqNzRVZ21aNTZYb0lWNmV0?=
 =?utf-8?B?R3JEZjVUam0rNEhzbWVvRzdnVWZmUjY5Nlk0U0szYndOUDBDNmtQWmdJNytL?=
 =?utf-8?B?ME84ZFp5RnZ1MndHVTIzTThoK3pjZFBFQmYvOHFET3dSWUExK1ZFeHpSTFU1?=
 =?utf-8?B?aHJ0bE4zMldDQ3Q4RlhwZlV4U1IvWnlmNGp0RjRaZVZML3lvTVkyV2RFMHRD?=
 =?utf-8?B?K0lVWDJPblpCMU10L25nVXZKR2ZqeSsxR1JDZlRtdzFsMXRxb3dmeFA4ZVdX?=
 =?utf-8?B?UFlzN2ppQWkrWkRod1Y3R2xPTlJIUEFoaE10OWl1WWZaMHg2MFh3QzdFNGpv?=
 =?utf-8?B?eTNGUFNXandSRkF4UmJnUFE3dUVtdm91R0R4b3loVUllZXRjcUszYUNOa1Z4?=
 =?utf-8?B?QzFBaDN1aTJrL1VjODJMK2Jiei91MTNSRzVhMisrdjN0UXdRdEVselVaK3po?=
 =?utf-8?B?dDQyYUFwQ29idlY5aWcrTGVsTmxEZGIvWGVHR0dKYUNvUkczTTR1bnlaeERU?=
 =?utf-8?B?Q1ZUWVNCelhabGxEc2cyTjFMSk9NT0l4MjVDa2tibncvbGpZSlppSEM5bDJv?=
 =?utf-8?B?dUdJNHpoOGZEbndrVnEwSUdwWHozbSswN3MwK0o1TlZUSVQrOGJ6NzlhWWtT?=
 =?utf-8?B?MVJuZUQ1YWd6djRGQW5TL0lxbjYvSmdodmF5Lzk4NDlObk5CV1NyWlZxNi9w?=
 =?utf-8?B?K3o3UGVDZEQ2R2FGTGVXYzNLZlBLRWlGYlF3aDJjdkhSMWVybTNnaUZEUlRQ?=
 =?utf-8?B?UjJSMjk4eWRpbkFwVVcvMit0TnUxcG1XRktLd3QzV1Q5MHVTYVV5S3VZVHBk?=
 =?utf-8?B?b25JUGFSQUc3WFB2cysydkdkak9XSlc4c3JGdC91TktkeWxWczh3ZTd5QWVk?=
 =?utf-8?B?cExOUXJUSjVVVmxFbW0xd1JJK0JDdU5QajBPT1VCNUFIMWpmTGs2djB0anZC?=
 =?utf-8?B?K1pBd0pZWUxZbjlhclR4WUhMTmlIWmpnZ2hZQlZRUzR6cS9DMjd0RTI5alFK?=
 =?utf-8?B?WGJ3VXFLQWVGV0YvMHRQWFRxekJaT1RYdlFEYTdqUGx2Vkd5Q3FKQm4yTnNY?=
 =?utf-8?B?b3ZRandPT0xsNjFWcmFqYjhRb0N0RTViVllGNkM0dUZPV2UyOW1HbXJra2pF?=
 =?utf-8?B?RGFXYlQvUjkwand2YVgzNnd6ZEQrYzV4dU5IaHZCUlcyUkEvazdqSmlVdXpH?=
 =?utf-8?B?OEZNQlVDT0pPS2pOdFFvM05xWk9kL2NudWVHN0dpck4rUEZFb0lpMUU3ZzZs?=
 =?utf-8?Q?RJniUj2P2/M4Z85TMXa/S1Ji6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b31135-cadc-4de3-8c6c-08dad1468980
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 13:43:32.8362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpapADoHF1AiEJR+yE45yttn4dPHyxKGsKbvLK+DmVuV8qunleGu0olT3GbdyVq3bBqv/VcZQ3lrU+1oaZGldw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6220
Received-SPF: pass client-ip=40.107.22.121; envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Nov 2022 09:07:20 -0500
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
X-List-Received-Date: Mon, 28 Nov 2022 13:48:43 -0000

On 11/28/22 14:02, Andrey Drobyshev wrote:
> According to GLib changelog [1], since version 2.73.2 GLib is using
> libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
> fails due to missing DLL.
>
> This commit makes wixl to put libpcre2-8-0.dll into the MSI bundle.
>
> [1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2
>
> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
> ---
>   qga/installer/qemu-ga.wxs | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> index 813d1c6ca6..73ce2c4965 100644
> --- a/qga/installer/qemu-ga.wxs
> +++ b/qga/installer/qemu-ga.wxs
> @@ -101,8 +101,8 @@
>             <Component Id="libwinpthread" Guid="{6C117C78-0F47-4B07-8F34-6BEE11643829}">
>               <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll" Source="$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
>             </Component>
> -          <Component Id="libpcre" Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
> -            <File Id="libpcre_1.dll" Name="libpcre-1.dll" Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
> +          <Component Id="libpcre2" Guid="{F92A3804-B59C-419D-8F29-99A30352C156}">
> +            <File Id="libpcre2_8_0.dll" Name="libpcre2-8-0.dll" Source="$(var.BIN_DIR)/libpcre2-8-0.dll" KeyPath="yes" DiskId="1"/>
>             </Component>
>             <Component Id="registry_entries" Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
>               <RegistryKey Root="HKLM"
> @@ -153,7 +153,7 @@
>         <ComponentRef Id="libssp" />
>         <ComponentRef Id="libwinpthread" />
>         <ComponentRef Id="registry_entries" />
> -      <ComponentRef Id="libpcre" />
> +      <ComponentRef Id="libpcre2" />
>       </Feature>
>   
>       <InstallExecuteSequence>
Ack

